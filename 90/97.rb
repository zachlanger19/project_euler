start = Time.now

puts (2 ** (7830457%7812500) * 28433 + 1).to_s[-10..-1]
puts "#{ Time.now - start } seconds"