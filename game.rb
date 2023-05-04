require_relative "guess.rb"
require_relative "computer_guess.rb"
class Game
  include Guess
  include ComputerGuess
  
  attr_reader :code, :guess_control
  
  def initialize
    @guess_control = Array.new(4)
    @turn_counter = 1
    @keep_going = true
    self.game
  end

  def game
    puts "How do you want to play?"
    puts "[1] - I want to be the Codebreaker!"
    puts "[2] - I want to be the Codemaker!"
    while @keep_going
      print "Your choice: "
      @choice = gets.chomp
      if @choice != "1" && @choice != "2"
        puts "You must select 1 or 2!"
      else
        @keep_going=false
      end
    end

    if @choice == "1"
      self.generate_code
      while @turn_counter <=8
        self.request_guess
        self.format_guess
        self.check_guess(@code)
        @victory = self.victory?
        if @victory then break end
        self.print_hints
        self.turn_control
        self.reset_guess
      end
      if @victory  
        puts "Player Won! The code is #{@code.join}!" 
      else 
        puts "Player Lost! The code was #{@code.join}!" 
      end
    else
      self.generate_possible_codes
      self.request_code
      while @turn_counter <=8
        self.generate_guess
        self.format_guess
        self.check_guess(@code)
        @victory = self.victory?
        if @victory then break end
        self.print_guess
        self.print_hints
        self.check_possible_codes
        self.turn_control
        self.reset_guess
      end
      if @victory 
        puts "You lost! The computer correctly guessed the code #{@code.join}" 
      else 
        puts "You Won! The computer didn't crack the code #{@code.join}!" 
      end
    end
  end

  def generate_code
    @code = Array.new()
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

  def request_code
    while @code.nil?
      puts "Input the code! Remember, it must be 4 numbers, from 1 to 6!"
      self.code=gets.chomp
    end
  end

  def code=(input)
    #check if the input only have four elements
    if input.length != 4
      p "Invalid Input. There must be 4 numbers!"
    elsif !input.match(/[1-6]{4}/)
      p "Invalid Input. A number is not between 1 and 6!"
    else
      @code = input.chars.map{|number| number.to_i}
    end
  end

  def print_guess
    puts "\n(#{@turn_counter}/8) I guess #{@guess}"
  end
end