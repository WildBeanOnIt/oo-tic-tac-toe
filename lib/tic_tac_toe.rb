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

    def move(board, index, value)
        board[index] = value
    end















end
