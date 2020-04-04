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
    
    def input_to_index(input_string)
      input = input_string.to_i
      if input_string == "" 
        raise_error(ArgumentError)
      end
      input = input_string.to_i ## make integer from input
      input.between?(1..9) ? @index=input-1 : raise_error(ArgumentError)
      index
    end




end