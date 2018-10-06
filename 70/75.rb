require 'prime'
require 'set'

start = Time.now

seen = Set.new
seenMultiple = Set.new

L = 1_500_000
t = 1
tFactors = Set.new

while 2 * (t**2) < L
    s = t + 2
    while (l = s*t + s*s) < L
        multiplier = 2
        while l < L
            if tFactors.disjoint? Prime.prime_division(s).transpose[0].to_set
                seenMultiple << l if seen.include?(l)
                seen << l
            end
            l = l * multiplier / (multiplier - 1)
            multiplier += 1
        end

        s += 2
    end

    t += 2
    tFactors = Prime.prime_division(t).transpose[0].to_set
end

p (seen - seenMultiple).length

p "#{Time.now - start} sec"
