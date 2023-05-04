#puts "\n(1/8)Input the combination of four numbers, from 1 to 6: "
#puts "1234"
#puts "\u26ab\u26aa"
#puts "(2/8)Input the combination of four numbers, from 1 to 6: "
#puts "..."
#puts "(8/8)Input the combination of four numbers, from 1 to 6: "
#puts "\n"
#puts "\n You lost! The correct code was 5246\n\n"
#puts "\n You won! The correct code is 5246\n\n"

#input = "17"
###p input.chars.map{|number| number.to_i}
##
##
#
##  p "0001"
#if input.length !=4
#  p "0001"
#elsif !input.match(/[1-6]{4}/)
#  p "0000"
#else
#  p input
#end

puts "\nHow do you want to play?"
puts "[1] - I want to be the Codebreaker!"
puts "[2] - I want to be the Codemaker!\n\n"

puts "\nInput the code! Remember, it must be four numbers, from 1 to 6!\n\n"

puts "\nInvalid input! A number is not between 1 and 6!\n\n"

puts "(1/8) I guess 4512"
puts "\u26ab\u26aa"
puts "(2/8) I guess 4563"
puts "\u26ab\u26aa\u26aa\u26aa"

puts "\n You lost! The computer correctly guessed the code 6534\n\n"

puts "(8/8) I guess 6543"
puts "\n You Won! The computer didn't crack the code 6534\n\n"

#guess_control = [0,1,1,0]
#hint = guess_control.compact.sort.reverse
#hint.each {|value| value == 1 ? (print "\u26ab") : (print "\u26aa")}
#
#p hint
possible_codes = Array.new
for i in 1..6
  for j in 1..6
    for k in 1..6
      for l in 1..6
        possible_codes.push((i.to_s + j.to_s + k.to_s + l.to_s).to_i)
      end
    end
  end
end

p possible_codes