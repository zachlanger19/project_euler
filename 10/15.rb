start = Time.now

gridSize = 20;
paths = 1;
counter = 0

gridSize.times do
  paths *= (2 * gridSize) - counter;
  paths /= counter + 1;
  counter += 1
end

puts paths
puts "#{(Time.now - start) * 1000} milliseconds"