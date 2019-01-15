require 'prime'

start = Time.now

@max = 4_000_000
max_num_of_primes = Math.log(@max, 3).ceil

# Array of necessary primes
@primes = Prime.first(max_num_of_primes)
p @primes
# Array of exponents for each prime
exps = Array.new(@primes.length, 0)

# Initialize minimum solution to max int
machine_bytes = ['foo'].pack('p').size
machine_bits = machine_bytes * 8
@min = 2**(machine_bits-1) - 1

# Get next necessary exponent to satisfy desired number of factors
def pick_exp(exps)
  (((@max.to_f / exps.inject(1) {|value, exp| value * (2 * exp + 1)}) - 1) / 2.0).ceil
end

# Get minimal set of exponents to satisfy desired number of factors
def pick_exps(exps, index = 0, max_e = 12)
  if index == exps.length
    return exps if (exps.inject(1) {|value, exp| value * (2 * exp + 1)} / 2.0).ceil > @max
  else
    (0..max_e).reverse_each do |e|
      exps[index] = e
      max_e = e < pick_exp(exps) ? e : pick_exp(exps)
      possible_exps = pick_exps(exps, index + 1, max_e)
      next unless possible_exps.kind_of?(Array)
      next unless Prime.int_from_prime_division(@primes.zip(possible_exps)) < @min
      @min = Prime.int_from_prime_division(@primes.zip(possible_exps))
    end
  end
end

pick_exps(exps)
p @min

p "#{(Time.now - start) * 1000} ms"
