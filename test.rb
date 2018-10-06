require 'benchmark'
require 'bigdecimal'
require 'prime'

(1..100000).each do |n|
    x = n*(n+1)/2
    if Math.sqrt(x) == Math.sqrt(x).floor
        puts "x: #{x}, sqr_base: #{Math.sqrt(x).to_i}, tri_base: #{n}"
    end
end
