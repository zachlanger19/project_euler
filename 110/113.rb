start = Time.now

count = 0
(1..10**6 - 1).each do |x|
    xStr = x.to_s.split('')
    count += 1 if xStr == xStr.sort || xStr == xStr.sort.reverse
end
p count

p "#{(Time.now - start) * 1000} ms"
