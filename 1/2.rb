start = Time.now

a = 1
b = 2
sum = 2
while b < 4_000_000
  a, b = b, a + b
  sum += b if (b % 2).zero?
end

puts sum
puts "#{(Time.now - start) * 1000} milliseconds"