require 'prime'
require 'set'

def repunit(r)
    x = ''
    r.times {x << '1'}
    return x.to_i
end

def divisors_of(num)
   (2..num-1).select { |n|num % n == 0}
 end

def prime_divisors(l)
    divisors1 = divisors_of(l)
    if divisors1.length == 0
        return Set.new Prime.prime_division(repunit(l)).transpose[0]
    end
    result = Set.new
    x = repunit(l)
    divisors1.each do |d|
        divisors2 = prime_divisors(d)
        result += divisors2
        divisors2 .each do |y|
            if x % y == 0
                x /= y
            end
        end
    end
    result += Set.new Prime.prime_division(x).transpose[0]
    return result
end

# L = 10**9
# i = 2
# result = Set.new
# while result.size < 45
#     if L % i == 0
#         result += prime_divisors(i)
#         p i
#     end
#     i += 1
# end


p prime_divisors(64)
