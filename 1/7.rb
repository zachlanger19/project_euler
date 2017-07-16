require 'prime'
start = Time.now

puts Prime.first(10_001).last
puts "#{(Time.now - start) * 1000} milliseconds"