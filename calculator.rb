@history = []
@last_result = nil

def welcome
  puts '------------------------------'
  puts 'Welcome to the Ruby Calculator'
  puts '------------------------------'
end

def user_input
  print "input calculation -> "
  input = filter_input(check_command(gets.strip))
  calculate(input)
end

def calculate(inputs)
  result = eval(inputs.join)
  @last_result = result
  calculation = "#{inputs.first} #{inputs[1]} #{inputs.last} = #{result}"
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
  # s.split("").drop(3).join("")
  # .scan(/\d+/).first
  # check if number, operator, or parentheses
  # 

  if inputs.size > 3
    input_error("error1")
  elsif inputs.first.to_i.to_s != inputs.first
    input_error("error2")
  elsif !['+','-','*','/'].include?(inputs[1])
    input_error("error3")
  elsif inputs.last.to_i.to_s != inputs.last
    input_error("error4")
  else
    inputs
  end
end

def input_error(error)
  puts error
  user_input
end

welcome
user_input