class Tictactoe
attr_accessor :board, :turn, :player


	def initialize()
	@board = drawboard()
	@spots = [1, 2, 3, 4, 5, 6, 7, 8, 9]
	@turn = 0
	@wincase = [[1,2,3], [4,5,6], [7,8,9], [1,4,7], [2,5,8], [3,6,9], [1,5,9], [3,5,7]]
	@player = "X"
	end

	def drawboard()
		board  =  "1 | 2 | 3\n_________\n4 | 5 | 6\n_________\n7 | 8 | 9"
	end

	def alreadytaken(number)
		!@spots.include? number
	end	

	def replacespot(number)
		@board[number.to_s] = player
		@spots[number-1] = player
		@turn += 1
		
	end

	def place(number)
		if @spots.include? number 
			replacespot(number)
		end
	end

	def whosturn(turn)
		if turn % 2 == 0
			@player = "X"
		else
			@player = "O"
		end
	end

	def checkwinner()
		outer = 0
		inner = 0
		while outer <= @wincase.size do
			line = 0
			while inner <= 3 do
				
				line += 1 if @spots[outer][inner] == @player
				inner += 1
			end
			return true if line >= 3
			outer += 1
		end
		whosturn(@turn)
	end

	def win?
		true if checkwinner() == true
	end

	def tie?
		return true if turn >= 9
	end
end



	

