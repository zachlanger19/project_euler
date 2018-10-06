start = Time.now

def intShortestPaths(w)
    count = 0
    (1..w).to_a.combination(2).each do |d, h|
        if Math.sqrt((w**2) + ((d+h)**2)) % 1 == 0
            count += 1
            puts "w #{w}, d #{d}, h #{h}"
        end
    end
    (1..w).each do |d|
        if Math.sqrt((w**2) + ((d+d)**2)) % 1 == 0
            count += 1
            puts "w #{w}, d #{d}, h #{d}"
        end
    end
    return count
end

m = 0

count = 0
while count < 1_000_000
    m += 1
    count += intShortestPaths(m)
end
p m

puts "#{Time.now - start} sec"
