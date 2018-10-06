require 'prime'
start = Time.now

def primePair?(arr, new_prime)
  arr.all? { |n| (n.to_s + new_prime.to_s).to_i.prime? && (new_prime.to_s + n.to_s).to_i.prime? }
end

primes = Prime.each(10000).to_a


primes[0..-5].each_with_index do |a, ai|
  primes[ai+1..-4].each_with_index do |b, bi|
    next if !primePair?([a], b)
    primes[bi+1..-3].each_with_index do |c, ci|
      next if !primePair?([a, b], c)
      primes[ci+1..-2].each_with_index do |d, di|
        next if !primePair?([a, b, c], d)
        primes[di+1..-1].each do |e|
          next if !primePair?([a, b, c, d], e)
          p [a, b, c, d, e]
          puts a + b + c + d + e
          puts (Time.now - start).to_s + " seconds"
          exit
        end
      end
    end
  end
end
