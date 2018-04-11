require 'pry'

# A method to reverse a string in place.
def string_reverse(my_string)
  if my_string == nil
    return nil
  elsif my_string.length == 1
    return my_string
  else
    origin = my_string.length - 1
    target = 0
    temp = nil
    (my_string.length / 2).times do
      temp = my_string[target]
      my_string[target] = my_string[origin]
      my_string[origin] = temp
      origin -= 1
      target += 1
    end
  end
  return my_string
end
