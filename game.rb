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
      p self.guess_control
      @guess = nil
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

  def check_guess
    #check if a value is in the code array
    @formatted_guess.each_index do |index|
      @code.each do |number|
        if @formatted_guess[index] == number then @guess_control[index] = 0 end
      end
    end

    #check if both value and position matches code array
    @formatted_guess.each_index do |index|
      if @formatted_guess[index] == @code[index] then @guess_control[index] = 1 end
    end
  end
end