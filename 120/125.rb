start = Time.now

a = 1
seenNumbers = []

max = 10 ** 8
result = 0

while a**2 * 2 < max
    sum = a ** 2
    b = a + 1
    while ( sum += b**2 ) < max
        if sum.to_s == sum.to_s.reverse && !seenNumbers.include?(sum)
            result += sum
            seenNumbers << sum
        end
        b += 1
    end
    a += 1
end

p result

finish = Time.now
puts("#{finish - start} seconds")
