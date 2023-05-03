require_relative "guess.rb"
class Game
  include Guess
  attr_reader :code, :guess_control
  
  def initialize
    @code = Array.new()
    @guess_control = Array.new(4)
    @turn_counter = 1
    self.game
  end

  def game
    self.generate_code

    while @turn_counter <=8
      p self.code
      self.request_guess
      self.format_guess
      self.check_guess
      @victory = self.victory?
      if @victory then break end
      self.print_hints
      self.turn_control
      self.reset_guess
    end
    if @victory then puts "Player Won! The code is #{@code.join}!" else puts "Player Lost! The code was #{@code.join}!" end
  end

  def generate_code
    4.times do
      @code.push(rand(1..6))
    end
  end
  
  def request_guess
    while @guess.nil?
      puts "(#{@turn_counter}/8) Input the combination of 4 numbers, from 1 to 6"
      self.guess=gets.chomp
    end
  end

  def check_guess
    #check if a value is in the code array
    @formatted_guess.each_index do |index|
      @code.each do |number|
        if @formatted_guess[index] == number  
          @guess_control[index] = 0 
        end
      end
    end

    #check if both value and position matches code array
    @formatted_guess.each_index do |index|
      if @formatted_guess[index] == @code[index] 
         @guess_control[index] = 1 
      end
    end
  end

  def reset_guess
    @guess = nil
    @guess_control = Array.new(4)
  end

  def victory?
    @guess_control == [1,1,1,1] ? true : false
  end

  def print_hints
    hints = @guess_control.compact.sort.reverse
    hints.each {|value| value == 1 ? (print "\u26ab") : (print "\u26aa")}
  end

  def turn_control
    @turn_counter +=1
  end
end