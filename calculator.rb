@history = []
@last_result
@first_calculation = true
@memory = 0
@operators = ['+','-','*','/','**']

def welcome
  puts '------------------------------'
  puts 'Welcome to the Ruby Calculator'
  puts '------------------------------'
end

def user_input
  if @first_calculation
    print "input calculation -> "
  else
    print "continue calculation -> #{@last_result} "
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
  display_calculation(calculation)
end

def calculate_trig(trig_function)
  if @first_calculation
    print "#{trig_function}: "
    number = gets.chomp
    input_error("Not A Number") unless valid_number?(number)
  else
    number = @last_result
  end
  if trig_function == "sin"
    result = Math.sin(number.to_f)
  elsif trig_function == "cos"
    result = Math.cos(number.to_f)
  end
  @last_result = result
  calculation = "#{trig_function}(#{number}) = #{result}"
  display_calculation(calculation)
end

def display_calculation(calculation)
  puts calculation
  @history << calculation
  @first_calculation = false
  user_input
end

def check_command(input)
  case input
    when "clear", "c"
      @first_calculation = true
      user_input
    when "history", "h"
      show_history
    when "clear history", "ch"
      @history.clear
      user_input
    when "sin", "cos"
      calculate_trig(input)
    when "m"
      memory_display
    when "m+"
      memory_add
    when "m-"
      memory_subtract
    when "m="
      memory_equals
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

def memory_display
  puts @memory
  user_input
end

def memory_add
  @memory += @last_result
  user_input
end

def memory_subtract
  @memory -= @last_result
  user_input
end

def memory_equals
  @memory = @last_result
  user_input
end

def filter_input(input)
  inputs = input.split(" ")
  inputs.each_with_index do |elem, index|

    # Check for valid input
    unless valid_number?(elem) || valid_operator?(elem) || elem == "m"
      input_error("Invalid Input")
    end

    # Check for valid calculation
    if @first_calculation
      inputs.each_with_index do |elem, index|
        if index.even?
          input_error("Invalid Calculation") unless valid_number?(elem)
        else
          input_error("Invalid Calculation") unless @operators.include?(elem)
        end
      end
    else
      inputs.each_with_index do |elem, index|
        if index.odd?
          input_error("Invalid Calculation") unless valid_number?(elem)
        else
          input_error("Invalid Calculation") unless @operators.include?(elem)
        end
      end
    end

    # Check for zero division
    if inputs[index -1] == "/"
      if elem.to_i == 0 || (elem == "m" && @memory == 0)
        input_error("Undefined")
      end
    end

    # Substitute memory
    if elem == "m"
      inputs[index] = @memory
    end

  end
  inputs.join(" ")
end

def valid_number?(number)
  if number.to_f % 1.0 == 0
    number.to_i.to_s == number
  else
    number.to_f.to_s == number
  end
end

def valid_operator?(operator)
  [@operators, '(', ')'].flatten.include?(operator)
end

def input_error(error)
  puts error
  user_input
end

welcome
user_input
