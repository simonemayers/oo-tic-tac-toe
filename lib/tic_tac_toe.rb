require "pry" 
class TicTacToe
    attr_accessor :board
    WIN_COMBINATIONS = [
        [0, 1, 2], 
        [3, 4, 5], 
        [6, 7, 8], 
        [0, 3, 6], 
        [1, 4, 7], 
        [2, 5, 8], 
        [0, 4, 8], 
        [6, 4, 2],  
    ]
    def initialize
        @board = Array.new(9, " ")
    end
    def display_board
        puts " #{board[0]} | #{@board[1]} | #{@board[2]} "
        puts "-----------"
        puts " #{board[3]} | #{@board[4]} | #{@board[5]} "
        puts "-----------"
        puts " #{board[6]} | #{@board[7]} | #{@board[8]} "
    end
    def input_to_index(input)
        index = input.to_i - 1
    end
    def move(index, play_token = "X")
        @board[index] = play_token
    end
    def position_taken?(index)
        @board[index] != " "
    end
    def valid_move?(index)
        index.between?(0, 8) && !position_taken?(index)
    end
    def turn_count
        @board.count {|space| space =="X" || space == "O"}
    end
    def current_player
        turn_count.even? ? "X" : "O"
    end
    def turn
        index = input_to_index(gets.chomp)
        if valid_move?(index) 
            move(index, current_player)
            display_board
        else
            turn 
        end
    end
    def won?
        WIN_COMBINATIONS.each do |combo|
            if @board[combo[0]] == "X" && @board[combo[1]] == "X" && @board[combo[2]] == "X"
                return combo
            elsif @board[combo[0]] == "O" && @board[combo[1]] == "O" && @board[combo[2]] == "O"
                return combo   
            end
        end
        false
    end
    def full? 
        @board.all? {|space| space != " "}
    end
    def draw? 
        if full? == true && won? == false
            true
        else
            false
        end
    end
    def over?
        if draw? || won? 
            true
        else
            false
        end
    end
    def winner
        WIN_COMBINATIONS.each do |combo|
            if @board[combo[0]] == "X" && @board[combo[1]] == "X" && @board[combo[2]] == "X"
                return "X"
            elsif @board[combo[0]] == "O" && @board[combo[1]] == "O" && @board[combo[2]] == "O"
                return "O"
            end
        end
        nil
    end
    def play 
        turn until over? 
        if won?
            puts "Congratulations #{winner}!"
        elsif draw?
            puts "Cat's Game!"
        end
    end

end