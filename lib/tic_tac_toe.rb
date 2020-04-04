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




end