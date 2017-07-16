start = Time.now

largest = 0
a = 999
b = 999
while a**2 > largest
  if a * b > largest
    if (a * b).to_s == (a * b).to_s.reverse
      largest = a * b
    else
      b -= 1
    end
  else
    a -= 1
    b = a
  end
end

puts largest
puts "#{(Time.now - start) * 1000} milliseconds"