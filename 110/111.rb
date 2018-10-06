require 'prime'
start = Time.now

max_repeats = Array.new(10, 0)
sums = Array.new(10, 0)

p max_repeats

Prime.each(10000000000) do |prime|
	next if prime < 1000000000
	(0..9).each do |d|
        if
    end
end

p sums.inject(:+)

p "#{(Time.now - start) * 1000} ms"
