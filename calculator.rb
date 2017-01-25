puts 'Welcome to the Ruby Calculator'

@operators = ['+', '-', '*', '/']

def valid_number_input?(input)
  input == "0" || input.to_i != 0 ? true : false
end

def valid_number_filter(input)
  if input == "0" || input.to_i != 0 
    return input.to_i
  else
    puts "Not A Number"
    exit(0)
  end
end

def input_error(error)
  puts error
  exit(0)
end

# I need to get the left hand for the equation

puts "What is the first Number?"
first_num = valid_number_filter(gets.chomp)
# first_num = gets.strip
# input_error("Not a number") unless valid_number_input?(first_num)
# first_num = first_num.to_i

# I need to get the operator for the equation
puts "What is the operator?"
operator = gets.strip
unless @operators.include?(operator)
  puts "Incorrect Operator"
  exit(0)
end

# I need to get the right hand operator for the equation
puts "What is the first Number?"
second_num = gets.strip.to_i

# I need to calculate
case operator
  when "+"
    puts first_num + second_num
  when "-"
    puts first_num - second_num
  when "*"
    puts first_num * second_num
  when "/"
    puts first_num / second_num
end

