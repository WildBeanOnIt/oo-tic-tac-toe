require 'pry'

class TicTacToe

    def initialize
        @board = Array.new(9, " ")
    end

    WIN_COMBINATIONS = [
    [0,1,2], #Top Row
    [3,4,5], #Middle Row
    [6,7,8], #Bottom Row
    [0,3,6], #Top left straight down to the bottom left
    [1,4,7], #Top middle straight down to the bottom
    [2,5,8], #Top right straight dowdn to the bottm right
    [0,4,8], #Diagonal top left to the bottom right
    [2,4,6], #Diagonal top right to the bottom left
    ]

    def display_board
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
        puts "-----------"
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
        puts "-----------"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end

    def input_to_index(input)
        input.to_i - 1
    end

    def move(index, value = X)
        @board[index] = value
    end

    def position_taken?(index)
        @board[index] == "X" || @board[index] == "O"
    end

    def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
    end

    def turn_count
        count = 0
        @board.each do |index|
            #binding.pry
            if index == "O" || index == "X"
                count += 1
            end
        end
        count
    end

    def current_player
        if turn_count % 2 == 0
            "X"
        else
            "O"
        end
    end

    def turn
        puts "Please enter a number between 1-9:"
        input = gets.chomp()
        index = input_to_index(input)
        if valid_move?(index)
          move(index, current_player)
          display_board
        else
          turn
        end
    end
    
    def won?
        WIN_COMBINATIONS.detect do |win|
            #binding.pry
            if @board[win[0]] == "X" && @board[win[1]] == "X" && @board[win[2]] == "X"
                return win
            elsif
                @board[win[0]] == "O" && @board[win[1]] == "O" && @board[win[2]] == "O"
                return win
            end
        end
        false
     end

    def full?
        @board.each do |spot|
            if spot == " " 
                return false
            end
        end
    end

    def draw?
        full? && !won?
    end

    def over?
        won? || draw?
    end

    def winner
        if won?
            @board[won?[0]]
        else
            return nil
        end
    end

    def play
        turn until over?
        if won?
            puts "Congratulations #{winner}!"
        elsif
            draw?
            puts "Cat's Game!"
        end
    end
    
end
