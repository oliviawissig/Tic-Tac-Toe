class Game
  attr_reader :moves
  attr_reader :player1
  attr_reader :player2

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2

    @moves = [1,2,3,4,5,6,7,8,9]
    @turn = player1
  end

  private

  def board
    print("\n #{@moves[0]} | #{@moves[1]} | #{@moves[2]} \n")
    print("---+---+---\n")
    print(" #{@moves[3]} | #{@moves[4]} | #{@moves[5]} \n")
    print("---+---+---\n")
    print(" #{@moves[6]} | #{@moves[7]} | #{@moves[8]} \n\n")
  end

  def check_winner()
    #winning moves (indexes)
    win = false
    winning_moves = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]

    winning_moves.each do |set| 
      #if all the indexes have the same symbol, set win to true
      if @moves[set[0]] == @moves[set[1]] && @moves[set[1]] == @moves[set[2]]
        win = true
      end
    end

    return win
  end

  public

  def play
    puts "Each number represents a location on the board. When it is your turn, enter a number and the board will update with your mark on the board."
    board()
    until check_winner() || (@moves.none? {|move| [1,2,3,4,5,6,7,8,9].include?(move) })
      @turn = @player1
      print "#{@player1.name}, which spot would you like for your turn?: "
      move1 = gets.chomp

      until @moves.include?(move1.to_i) do
        print "That's not on the board, or already taken! #{@player1.name}, which spot would you like for your turn?: "
        move1 = gets.chomp
      end

      index = @moves.index(move1.to_i)
      @moves[index] = @player1.initial
      board()
      if check_winner() || (@moves.none? {|move| [1,2,3,4,5,6,7,8,9].include?(move) })
        break
      end

      @turn = @player2
      print "#{@player2.name}, which spot would you like for your turn?: "
      move2 = gets.chomp

      until @moves.include?(move2.to_i) do
        print "That's not on the board, or already taken! #{@player2.name}, which spot would you like for your turn?: "
        move2 = gets.chomp
      end

      index = @moves.index(move2.to_i)
      @moves[index] = @player2.initial
      if @player1.initial == @player2.initial
        @moves[index] = "X"
      end
      board()
    end

    return @turn.name
  end
end