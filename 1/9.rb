start = Time.now

(1..1000 - 2).each do |a|
  (1..1000 - 1 - a).each do |b|
    c = 1000 - a - b
    if a**2 + b**2 == c**2
      puts puts a * b * c
      break
    end
  end
end

puts "#{(Time.now - start) * 1000} milliseconds"