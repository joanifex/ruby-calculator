# 3 + 4
# 5 - 2
# 6 * 8
# 9 / 3

while true
  print "input string ->"
  input = gets.strip.split(" ")
  if input.size > 3
    puts "WRONG"
  elsif input[0].to_i.to_s != input[0]
    puts "WRONG"
  elsif !['+','-','*','/'].include?(input[1])
    puts "WRONG"
  elsif input[2].to_i.to_s != input[2]
    puts "WRONG"
  else
    puts "RIGHT"
  end
end

