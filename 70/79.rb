require 'set'

passwords = [319,680,180,690,129,620,762,689,762,318,368,710,720,710,629,168,160,689,716,731,736,729,316,729,729,710,769,290,719,680,318,389,162,289,162,718,729,319,790,680,890,362,319,760,316,729,380,319,728,716]

sets = Array.new(10){Set.new}
p sets

passwords.each do |password|
    password = password.to_s.split('').map(&:to_i)
    sets[password[0]] << password[1] << password[2]
    sets[password[1]] << password[2]
end

sets.each_with_index do |set, i|
    print i
    p set
end
