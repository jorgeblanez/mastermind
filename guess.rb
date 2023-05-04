module Guess
  attr_reader :guess
  
  def guess=(input)
    #check if the input only have four elements
    if input.length != 4
      p "Invalid Input. There must be 4 numbers!"
    elsif !input.match(/[1-6]{4}/)
      p "Invalid Input. A number is not between 1 and 6!"
    else
      @guess = input
    end
  end

  def format_guess
    @formatted_guess = @guess.chars.map{|number| number.to_i}
  end

  def request_guess
    while @guess.nil?
      puts "(#{@turn_counter}/8) Input the combination of 4 numbers, from 1 to 6"
      self.guess=gets.chomp
    end
  end

  def check_guess(code)
    #check if a value is in the code array
    @formatted_guess.each_index do |index|
      code.each do |number|
        if @formatted_guess[index] == number  
          @guess_control[index] = 0 
        end
      end
    end

    #check if both value and position matches code array
    @formatted_guess.each_index do |index|
      if @formatted_guess[index] == code[index] 
         @guess_control[index] = 1 
      end
    end
  end

  def reset_guess
    @guess = nil
    @guess_control = Array.new(4)
  end


end