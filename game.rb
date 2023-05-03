require_relative "guess.rb"
class Game
  include Guess
  attr_reader :code
  
  def initialize
    @code = Array.new()
    @turn_counter = 1
    self.game
  end

  def game
    self.generate_code
    while @turn_counter <=8
      self.request_guess
    end
  end

  def generate_code
    4.times do
      @code.push(rand(1..6))
    end
  end

  def request_guess
    while guess.nil?
      puts "(#{@turn_counter}/8) Input the combination of 4 numbers, from 1 to 6"
      self.guess=gets.chomp
    end
  end
end