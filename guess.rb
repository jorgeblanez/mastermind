module Guess
  
  def initialize
    @guess = "0000"
  end

  def guess=(input)
    #check if the input only have four elements
    if !input.match(/([1-6])/)
      p "Invalid Input. A number is not between 1 and 6"
    elsif !input.match(/([1-6]){4}/)
      p "Invalid Input. There must be four numbers"
    else
      @guess = input
    end

  end

  def format_guess(guess)
    @formatted_guess = guess.chars.map{|number| number.to_i}
  end

end