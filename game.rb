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
      
    end
  end

  def generate_code
    4.times do
      @code.push(rand(1..6))
    end
  end

  def request
end