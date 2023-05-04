module ComputerGuess
  
  def generate_possible_codes
    @possible_codes = Array.new()
    for i in 1..6
      for j in 1..6
        for k in 1..6
          for l in 1..6
            @possible_codes.push ((i.to_s + j.to_s + k.to_s + l.to_s).to_i)
          end
        end
      end
    end
  end

  
end