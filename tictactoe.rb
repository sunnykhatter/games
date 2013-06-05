class Tictactoe
attr_accessor :board, :turn, :player, :taken
	WINCASE = [[1,2,3], [4,5,6], [7,8,9], [1,4,7], [2,5,8], [3,6,9], [1,5,9], [3,5,7]]

	def initialize()
	@board = drawboard()
	@spots = "123456789"
	@turn = 0
	@player = "X"
	@taken = false
	end

	def drawboard()
		board  =  "1 | 2 | 3\n_________\n4 | 5 | 6\n_________\n7 | 8 | 9"
	end

	def set_taken()
		@taken = true
	end	

	def reset_taken()
		@taken = false
	end

	def replacespot(number)
		@board[number] = @player
		@spots[number] = @player
		@turn += 1
	end

	def place(number)
		reset_taken()
		if @spots.include? number
			replacespot(number)
		else 
			set_taken()
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
		WINCASE.each do |outer|
			towin = 0
			outer.each do |winnum|
				towin += 1 if @spots[winnum-1] == @player
			end
			return true if towin >= 3
		end
		
	end

	def win?
		true if checkwinner() == true
	end

	def tie?
		whosturn(@turn)
		return true if turn >= 9
	end
end



	

