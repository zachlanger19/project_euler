require 'date'
start = Time.now

startYear = 1901
endYear = 2000
month = 1
count = 0

(startYear..endYear).each do |year|
  (1..12).each do |month|
    if Date.new(year, month, 1).sunday?
      count += 1
    end
  end
end

puts count
puts "#{(Time.now - start) * 1000} milliseconds"