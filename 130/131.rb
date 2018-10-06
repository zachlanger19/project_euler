require 'prime'

n = 1
count = 0
while (p = (n+1)**3 - n**3) < 1_000_000
    if p.prime?
        puts("n: #{n**3}, p: #{p}")
        count += 1
    end
    n += 1
end


p count
