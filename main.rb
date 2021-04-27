require_relative 'Classes/game'
require_relative 'Classes/player'

def play

    puts "\nWelcome to Tic-Tac-Toe! First, I'll need the names of our two players. "
    print "\nPlayer 1, what is your name?: "
    p1_name = gets.chomp
    p1 = Player.new(p1_name)

    print "Player 2, what is your name?: "
    p2_name = gets.chomp
    p2 = Player.new(p2_name)

    puts "\nThank you! Next, let me get the game started."
    game = Game.new(p1, p2)
    winner = game.play()

    puts "Congratulations, " + winner + "! Tic-Tac-Toe!\n\n"
    
end

play()