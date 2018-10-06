d = 100
d_max = 0
x_max = 0

def solve_diophantine(d)
  x = 0
  y = 1
  loop do
    x = Math.sqrt(1 + (d * y**2))
    break if x == x.floor
    y += 1
  end
  puts("d = #{d}, x = #{x}, y = #{y}")
  x
end

(1..d).each do |d|
  next if Math.sqrt(d) == Math.sqrt(d).floor
  x = solve_diophantine(d)

  if x > x_max
    x_max = x
    d_max = d
  end
end

puts "Largest: #{x_max}, D: #{d_max}"
