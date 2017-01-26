@history = []
@last_result
@first_calculation = true

def welcome
  puts '------------------------------'
  puts 'Welcome to the Ruby Calculator'
  puts '------------------------------'
end

def user_input
  if @first_calculation
    print "input calculation -> "
  else
    print "continue calculation -> #{@last_result}  "
  end
  inputs = filter_input(check_command(gets.strip))
  calculate(inputs)
end

def calculate(inputs)
  if @first_calculation
    @last_result = eval(inputs)
    calculation = "#{inputs} = #{@last_result}"
  else
    result = eval("#{@last_result} #{inputs}")
    calculation = "#{@last_result} #{inputs} = #{result}"
    @last_result = result
  end
    puts calculation
    @history << calculation
    @first_calculation = false
    user_input
end

def trig(input)
  trig_function = input
  puts "#{trig_function}: "
  number = gets.chomp
  input_error("Not A Number") unless valid_number?(number)
  result = input == "sin" ? Math.sin(number) : Math.cos(number)
end

def check_command(input)
  case input
    when "clear"
      @first_calculation = true
      user_input
    when "history"
      show_history
    when "clear history"
      @history.clear
      user_input
    when "sin", "cos"
      trig(input)
    when "quit"
      puts "Goodbye"
      exit(0)
    else
      input
  end
end

def show_history
  puts "History:"
  @history.each { |calculation| puts "  #{calculation}" }
  user_input
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
  number.to_f % 1.0 == 0 ? number.to_i.to_s == number : number.to_f.to_s == number
end

def valid_operator?(operator)
  operators = ['+','-','*','/','(',')', 'sin(', 'cos(']
  operators.include?(operator)
end

def input_error(error)
  puts error
  user_input
end

welcome
user_input
