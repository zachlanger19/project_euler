start = Time.now

gridSize = 20
paths = 1

gridSize.times do |counter|
  paths *= (2 * gridSize) - counter
  paths /= counter + 1
  p paths
end

puts paths
puts "#{(Time.now - start) * 1000} milliseconds"