found_m = {1 => 0, 2 => 1}
found_path = {1 => [], 2 => [1]}

(3..200).each do |k|
  min = k
  min_a = 0
  min_b = 0
  path = []
  (1..k / 2).reverse_each do |a|
    b = k - a
    m = found_path[b].include?(a) || a == b ? found_m[b] + 1 : found_m[a] + found_m[b] + 1

    if m < min
      min = m
      path = (found_path[min_a] + found_path[min_b] + [min_a, min_b]).uniq
    elsif m == min
      path = (path + found_path[min_a] + found_path[min_b] + [min_a, min_b]).uniq
    end
  end
  found_m[k] = min
  found_path[k] = path
end


(1..200).each do |k|
  puts "k: #{k}, m(k): #{found_m[k]}, path(k): #{found_path[k]}"
end

p found_m.values.inject(:+)

# there could be an alternative path
