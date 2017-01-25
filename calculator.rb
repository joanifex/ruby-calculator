@operators = ['+', '-', '*', '/']

def calculator_interface
  puts 'Welcome to the Ruby Calculator'

  puts "What is the first Number?"
  first_num = valid_number_filter(gets.chomp)

  puts "What is the operator?"
  operator = gets.strip
  unless @operators.include?(operator)
    puts "Incorrect Operator: Only + - / * are supported."
    exit(0)
  end

  puts "What is the second Number?"
  second_num = valid_number_filter(gets.chomp)

  puts operate(first_num, operator, second_num)

  calculator_interface
end

def operate(num1, operator, num2)
  case operator
    when "+"
      return num1 + num2
    when "-"
      return num1 - num2
    when "*"
      return num1 * num2
    when "/"
      return num1 / num2
  end
end

def valid_number_filter(input)
  calculator_interface() if input == "clear"
  if input == "0" || input.to_i != 0 
    return input.to_i
  else
    puts "Not A Number"
    calculator_interface
  end
end

calculator_interface