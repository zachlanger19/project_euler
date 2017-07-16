start = Time.now

str = '0'
(1..1000000).each do |number|
	str << number.to_s
	break if str.length > 1000000
end

p str[1].to_i * str[10].to_i * str[100].to_i * str[1000].to_i * str[10000].to_i  * str[100000].to_i  * str[1000000].to_i
p "#{(Time.now - start) * 1000} milliseconds"