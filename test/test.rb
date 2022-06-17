# frozen_string_literal: true

require 'yoshinon/sig/int'
require 'yoshinon/sig/term'

Yoshinon.on_trap do |val|
  puts val
end

Yoshinon.lock do
  sleep 5
  puts 'hoge'
end

Yoshinon.lock do
  sleep 5
  puts 'fuga'
end

sleep 10
