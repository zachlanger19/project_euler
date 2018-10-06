require 'prime'
start = Time.now

@primes = Array.new
Prime.each(10000).each do |prime|
  next if prime < 1490
  @primes.push(prime)
end

def search
  @primes.each do |prime|
    perms = prime.to_s.split('').permutation.map {|perm| perm.join.to_i}
    perms.uniq!
    perms.reject! {|n| !n.prime?}
    next if perms.length < 3
    perms.each_with_index do |prime1, i|
      differnces = Hash.new
      perms[i+1..-1].each do |prime2|
        differnce = prime2 - prime1
        if differnces[differnce] == 0
          return "#{prime1}#{prime1+differnce/2}#{prime1+differnce}"
        else
          differnces[differnce*2] = 0
        end
      end
    end
  end
end


p search
p "#{(Time.now - start) * 1000} milliseconds"












