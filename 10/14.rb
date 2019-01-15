require_relative '../utils/discrete_math'

start = Time.now

result = 0
largest = 0
(1..1_000_000).each do |n|
  d = DiscreteMath.collatz_distance(n)
  if d > largest
    largest = d
    result = n
  end
end

p result
puts "#{(Time.now - start) * 1000} milliseconds"