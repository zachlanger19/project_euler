require 'prime'
start = Time.now

puts 600_851_475_143.prime_division[-1][0]
puts "#{(Time.now - start) * 1000} milliseconds"