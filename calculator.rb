@history = []
@last_result = nil

def welcome
  puts '------------------------------'
  puts 'Welcome to the Ruby Calculator'
  puts '------------------------------'
end

def user_input
  print "input calculation -> "
  inputs = filter_input(check_command(gets.strip))
  calculate(inputs)
end

def calculate(inputs)
  result = eval(inputs)
  @last_result = result
  calculation = "#{inputs} = #{result}"
  @history << calculation
  puts calculation
  user_input
end

def check_command(input)
  case input
    when "clear"
      user_input
    when "history"
      puts " History: #{@history}"
      user_input
    when "quit"
      puts "Goodbye"
      exit(0)
    else
      input
  end
end

def filter_input(input)
  inputs = input.split(" ")
  inputs.each do |elem|
    unless valid_number?(elem) || valid_operator?(elem)
      input_error("Invalid Input")
    end
  end
  input
end

def valid_number?(number)
  number.to_i.to_s == number
end

def valid_operator?(operator)
  ['+','-','*','/','(',')'].include?(operator)
end
  
def input_error(error)
  puts error
  user_input
end

welcome
user_input