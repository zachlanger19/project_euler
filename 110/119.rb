start = Time.now

def digit_sum(n)
    return n.to_s.split('').map(&:to_i).inject(:+)
end

results = Array.new
(2..100).each do |n|
    power = n
    while power.to_s.length < n
        power *= n
        results << power if digit_sum(power) == n
    end
end

p results.sort[29]

finish = Time.now
puts("#{finish - start} seconds")
