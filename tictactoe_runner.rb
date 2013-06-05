require_relative "tictactoe"

class TictactoeRunner

	def self.run

		@game = Tictactoe.new
		 
	 	while true
			puts @game.board
			puts "Spot not available" if @game.taken == true
			puts "It is the #{@game.player} players turn."
			puts "Enter a number to take that spot"
			number = gets.chomp.to_i
	 		puts "**********************\n\n"

			@game.place(number)

			if @game.win?
				puts @game.board
				puts "\n\nPlayer #{@game.player} is the winner!\n"
				break
			elsif @game.tie?
				puts @game.board
				puts "\n\nThe game has ended in a tie. You're both equally bad.\n"
				break
			end
		end
	end
end



TictactoeRunner.run


	