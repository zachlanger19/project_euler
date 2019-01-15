require 'prime'

start = Time.now

z = 4
z += 1 while (Prime.prime_division(z).transpose[1].map {|x| 2 * x + 1}.inject(:*) / 2.0).ceil < 1_000
p z

p "#{(Time.now - start) * 1000} ms"