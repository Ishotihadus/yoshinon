# frozen_string_literal: true

require 'yoshinon/sig/int'

Yoshinon.on_trap do
  puts 'Signal received!'
end

Yoshinon.lock do
  10.times do
    sleep 0.2
    puts 'running...'
  end
  puts 'end!'
end
