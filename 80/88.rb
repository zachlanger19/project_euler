require 'time'
require 'set'

# def min_prod_sum(k)
#     a = Array.new(k, 1)
#
#     history = []
#
#     while a.inject(:*) != a.inject(:+)
#         i = -1
#         while a.inject(:*) < a.inject(:+)
#             i += 1
#             a[i] += 1
#             history.push(i)
#         end
#
#         while a.inject(:*) > a.inject(:+)
#             if i == 0
#                 a[history[-2]] -= 1
#                 history.pop(2)
#             else
#                 a[history.pop] -= 1
#             end
#         end
#     end
#
#     return a.inject(:+)
# end

def min_prod_sum(k)
    a = Array.new(k, 1)

    while a.inject(:*) != a.inject(:+)
        i = -1
        while a.inject(:*) < a.inject(:+)
            i += 1
            a[i] += 1
        end

        if a.inject(:*) > a.inject(:+)
            if a.index(1) != nil
                a[a.index(1) - 1] -= 1
            else
                a[-1] -= 1
            end
        end
    end

    return a.inject(:+)
end

start = Time.now

min_prod_sums = Set.new
(2..12).each do |k|
  result = min_prod_sum(k)
  puts("#{k}: #{result}")
  min_prod_sums << result
end

finish = Time.now

p min_prod_sums
# p min_prod_sums.to_a.inject(:+)
puts("#{finish - start} seconds")
