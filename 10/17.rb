start = Time.now

def in_words(num)
  if num == 1000
    return "one thousand"
  elsif num / 100 > 0
    if num % 100 == 0
      return in_words(num/100) + " hundred"
    else
      return in_words(num/100) + " hundred and " + in_words(num%100)
    end
  elsif num / 20 > 0
    if num / 90 > 0
      return "ninety " + in_words(num%90)
    elsif num / 80 > 0
      return "eighty " + in_words(num%80)
    elsif num / 70 > 0
      return "seventy " + in_words(num%70)
    elsif num / 60 > 0
      return "sixty " + in_words(num%60)
    elsif num / 50 > 0
      return "fifty " + in_words(num%50)
    elsif num / 40 > 0
      return "forty " + in_words(num%40)
    elsif num / 30 > 0
      return "thirty " + in_words(num%30)
    elsif num / 20 > 0
      return "twenty " + in_words(num%20)
    end
  elsif num == 19
    return "nineteen"
  elsif num == 18
    return "eighteen"
  elsif num == 17
    return "seventeen"
  elsif num == 16
    return "sixteen"
  elsif num == 15
    return "fifteen"
  elsif num == 14
    return "fourteen"
  elsif num == 13
    return "thirteen"
  elsif num == 12
    return "twelve"
  elsif num == 11
    return "eleven"
  elsif num == 10
    return "ten"
  elsif num == 9
    return "nine"
  elsif num == 8
    return "eight"
  elsif num == 7
    return "seven"
  elsif num == 6
    return "six"
  elsif num == 5
    return "five"
  elsif num == 4
    return "four"
  elsif num == 3
    return "three"
  elsif num == 2
    return "two"
  elsif num == 1
    return "one"
  else
    return ""
  end
end

numberOfLetters = 0
(1..1000).each do |number|
  word = in_words(number)
  #puts word
  numberOfLetters += word.delete(' ').length
end
puts numberOfLetters

puts "#{(Time.now - start) * 1000} milliseconds"