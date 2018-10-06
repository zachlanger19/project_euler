require 'prime'

start = Time.now

def isRad?(a, b, c)
    Prime.prime_division(a * b * c).transpose[0].reduce(:*) < c
end

# result = 0
# max = 1000
# (2..max).each do |c|
#     # prime factors of C
#     cPrimes = Prime.prime_division(c).transpose[0]
#
#     # coprimes less than C
#     coprimes = (1..c).to_a.reject! { |x| cPrimes.any? { |cPrime| x % cPrime == 0 } }
#
#     # possible A values: less than half of C, and has A complementary B value in the list of coprimes
#     possibleAs = coprimes.select { |a| a < c / 2 && coprimes.include?(c - a) }
#
#     # check possible A values
#     possibleAs.each do |a|
#         b = c - a
#         # dont know whether or not b is co-prime with a
#         if isRad?(a, b, c)
#             result += c
#             puts "a: #{a}, b: #{b}, c: #{c}"
#         end
#
#     end
# end
#
# p result

count = 0
(2..10000).each do |abc|
    if (Prime.prime_division(abc).transpose[0].reduce(:*) == abc)
        p abc
        count += 1
    end
end

p count

finish = Time.now
puts("#{finish - start} seconds")



# is there a relation to primes less C(not including the prime factors of C)
# and the prime factors of A and B, also look into which primes aren't used

# is there a pattern in the prime factorization of C that leads to a 
