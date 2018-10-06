start = Time.now

def rMax(a)
    rmax = 0
    b = a - 1
    c = a + 1
    (1..2 * a).each do |n|
        r = (b**n + c**n) % (a**2)
        rmax = r > rmax ? r : rmax
    end
    return rmax
end


result = 0
(3..1000).each do |a|
    p a
    result += rMax(a)
end
p result

finish = Time.now
puts("#{finish - start} seconds")
