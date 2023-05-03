module Guess
  attr_reader :guess

  def guess=(input)
    #check if the input only have four elements
    if input.length != 4
      p "Invalid Input. There must be four numbers"
    elsif !input.match(/[1-6]{4}/)
      p "Invalid Input. A number is not between 1 and 6"
    else
      @guess = input
    end
  end

  def format_guess
    @formatted_guess = @guess.chars.map{|number| number.to_i}
  end

end