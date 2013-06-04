class Tictactoe
attr_accessor :board, :player


	def initialize()
	@board = drawboard()

	end

	def drawboard()

		board  =  "1 | 2 | 3\n_________\n4 | 5 | 6\n_________\n7 | 8 | 9"
	end

	def alreadytaken(number)
	end	

	def takespot(number)
	end

	def win?

	end

	def tie?

	end
end

game = Tictactoe.new
puts game.board

	

