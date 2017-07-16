require 'prime'
start = Time.now

sum = 0
Prime.each(2_000_000) { |n| sum += n }

puts sum
puts "#{(Time.now - start) * 1000} milliseconds"