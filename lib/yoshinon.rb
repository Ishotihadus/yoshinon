# frozen_string_literal: true

require 'set'
require_relative 'yoshinon/deshite'
require_relative 'yoshinon/version'

module Yoshinon
  @mutex = Mutex.new
  @cv = ConditionVariable.new
  @deshite_set = Set.new
  @on_trap = []

  def self.on_trap(&block)
    @on_trap << block
  end

  def self.define_trap(signal)
    Signal.trap(signal) do |value|
      @on_trap.each{|e| e.call(value)}
      Thread.new do
        @mutex.synchronize do
          @cv.wait(@mutex) until @deshite_set.empty?
        end
        exit 130
      end
    end
  end

  def self.lock
    if block_given?
      deshite = lock
      begin
        yield
      ensure
        unlock(deshite)
      end
    else
      deshite = Deshite.new
      @mutex.synchronize do
        @deshite_set << deshite
      end
      deshite
    end
  end

  def self.unlock(deshite)
    @mutex.synchronize do
      @deshite_set.delete(deshite)
      @cv.broadcast
    end
  end
end
