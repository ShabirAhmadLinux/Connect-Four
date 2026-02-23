require_relative 'connect_four_player'
require_relative 'connect_four_board'

class ConnectFour

  def initialize(plr1 = ConnectFourPlayer.new('⚪'), plr2 = ConnectFourPlayer.new('⚫'), brd = ConnectFourBoard.new)
    @player1 = plr1
    @player2 = plr2
    @board = brd
  end

  def play_turn
    @turn = player1.eql?(turn) ? player2 : player1
    turn.drop_on(board)
  end

  def play_game
    ask_details
    play_turn until game_over?
  end

  def ask_details
    print 'Enter Player 1 Name: '
    player_name1 = gets.chomp
    player1.set_name(player_name1)
    print 'Enter Player 2 Name: '
    player_name2 = gets.chomp
    player2.set_name(player_name2)
  end
  
  private 
  
  attr_accessor :player1, :player2, :turn, :board

  def game_over?
    board.win? || board.tie?
  end
  
end