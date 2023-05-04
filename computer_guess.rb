module ComputerGuess
  
  def generate_possible_codes
    @possible_codes = Array.new()
    for i in 1..6
      for j in 1..6
        for k in 1..6
          for l in 1..6
            @possible_codes.push (i.to_s + j.to_s + k.to_s + l.to_s)
          end
        end
      end
    end
  end

  def generate_guess
    if @possible_codes.length == 1296
      @guess = "1122"
    else
      @guess = possible_codes[0]
    end
  end

  def check_possible_codes
    @computer_guess_control = @guess_control.compact.sort.reverse
    @temp_code = @guess
    @possible_codes.delete(@temp_code)

    @possible_codes.each do |value|
      @guess = value
      self.format_guess(@temp_code)
      self.check_guess
      if @guess_control.compact.sort.reverse != @computer_guess_control then @possible_codes.delete(value) end
      @guess_control = Array.new(4)
    end
  end
end