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


guess_control = [0,1,1,0]
hint = guess_control.compact.sort.reverse
hint.each {|value| value == 1 ? (print "\u26ab") : (print "\u26aa")}

p hint