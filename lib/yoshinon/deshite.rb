# frozen_string_literal: true

module Yoshinon
  class Deshite
    attr_reader :caller

    def initialize
      @caller = Kernel.caller.freeze
    end

    def unlock
      Yoshinon.unlock(self)
    end
  end
end
