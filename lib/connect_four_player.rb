class ConnectFourPlayer
  attr_reader :symbol, :name

  @@count = 0

  def initialize(sym = '⛔', name = "Player#{@@count + 1} ")
    @symbol = sym
    @name = name
    @@count += 1
  end

  def drop_on(board)
    loop do
      print 'Enter a column to drop'
      col = gets.chomp
      return board.make_move(@symbol) if board.set_valid(col)

      board.display_error
    end
  end

  def update_name(player_name)
    @name = player_name unless player_name.empty?
  end
end
