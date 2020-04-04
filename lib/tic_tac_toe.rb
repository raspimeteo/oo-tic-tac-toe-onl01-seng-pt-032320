require "pry"

class TicTacToe

    def initialize(board=nil)
        @board = board || Array.new(9, " ")
    end

    WIN_COMBINATIONS = [[0, 1, 2],
                        [3, 4, 5],
                        [6, 7, 8],
                        [0, 3, 6],
                        [1, 4, 7],
                        [2, 5, 8],
                        [0, 4, 8],
                        [6, 4, 2]]

    def display_board
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
        puts "-----------"
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
        puts "-----------"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end
    
    def input_to_index(input)
      input = input.to_i
      index = input - 1
    end
    
    def move (index, token = "X")
      @board[index] = token
    end
    
    def position_taken?(index)
      if (@board[index] == 'X' || @board[index] == "O")
        true
      else
        false
      end
    end
    
    def valid_move?(index)
      if (position_taken?(index) || index < 0 || index > 8)
        false
      else
        true
      end
    end
    
    def turn_count
      count = 0
      @board.each do |field|
        if (field == "X" || field == "O")
          count += 1
        end
      end
      count
    end
    
    def current_player
      if turn_count%2 == 0
        "X"
      else
        "O"
      end
    end
    
    
    def turn
      puts "Enter a field 1-9:"
      input = gets.chomp
      index = input_to_index(input)
      if index.between?(0,8)
        valid_move?(index)
        move(index, current_player)
        display_board
      else
        turn
      end
    end
        
    def won?
      WIN_COMBINATIONS.each {|win_combination|
        place_0 = @board[win_combination[0]]
        place_1 = @board[win_combination[1]]
        place_2 = @board[win_combination[2]]
        if place_0 == "X" && place_1 == "X" && place_2 == "X"
          return win_combination
        elsif place_0 == "O" && place_1 == "O" && place_2 =="O"
          return win_combination
        end
        }
      return false
    end
    
    def full?
      @board.all?{|token| token == "X" || token == "O"}
    end
    
    def draw?
      full? && !won? ? true : false
    end



end