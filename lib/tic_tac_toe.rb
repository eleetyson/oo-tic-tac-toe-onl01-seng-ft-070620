require 'pry'
class TicTacToe
  
  WIN_COMBINATIONS = [ 
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6]
    ]

  def initialize
    @board = Array.new(9, " ")
  end
  
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index(input)
    index = input.to_i - 1
  end
  
  def move(index, token = "X")
    @board[index] = token
  end
  
  def position_taken?(index)
    @board[index] == "X" || @board[index] == "O" ? true : false
  end
  
  def valid_move?(index)
    index.between?(0, 8) && !position_taken?(index) ? true : false
  end
  
  def turn_count
    @board.count {|i| i == "X" || i == "O"}
  end
  
  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end
  
  def turn
    puts "Please enter 1-9:"
    input = gets.chomp
    index = input_to_index(input)
    
    if valid_move?(index)
      move(index, current_player)
      display_board
    else
      turn
    end
    
  end
  
  def won? 
    WIN_COMBINATIONS.detect { |c| @board[c[0]] == @board[c[1]] && @board[c[1]] == @board[c[2]] }
  end
  
  def full?
    !@board.include?(" ")
  end
  
  def draw?
    !won? ? full? : false
  end
  
  def over?
    won? || draw?
  end
  
  def winner
    @board[won?[0]] != " " ? @board[won?[0]] : nil
  end
  
  def play
    unless full? || draw? 
      turn
    end
    
    won? ? "Congratulations #{winner}!" : "Cats Game!"
  end
  
end