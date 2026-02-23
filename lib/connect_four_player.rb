class ConnectFourPlayer

  @@count = 0

  def initialize(sym = '⛔', name = "Player#{@@count + 1} ")
    @symbol = sym
    @name = name
    @@count += 1
  end

  def drop(board)
    
  end

  def update_name(name)
    @name = name unless name.empty?
  end
end
