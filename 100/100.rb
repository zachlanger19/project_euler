(1..100_000_000).each do |n|
  w = (n * (n - 1)) / 2
  x = Math.sqrt(1 + (4 * w))
  next if x != x.floor
  b = ((1 + Math.sqrt(1 + (4 * w))) / 2).to_i
  puts "#{n}: #{b}"
end