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