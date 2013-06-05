class Tictactoe
attr_accessor :board, :turn, :player, :spots


	def initialize()
	@board = drawboard()
	@spots = "123456789"
	@turn = 0
	@wincase = [[1,2,3], [4,5,6], [7,8,9], [1,4,7], [2,5,8], [3,6,9], [1,5,9], [3,5,7]]
	@player = "X"
	end

	def drawboard()
		board  =  "1 | 2 | 3\n_________\n4 | 5 | 6\n_________\n7 | 8 | 9"
	end

	def alreadytaken(number)
		!@spots.include? number.to_s
	end	

	def replacespot(number)
		@board[number.to_s] = @player
		@spots[number.to_s] = @player
		@turn += 1
		
	end

	def place(number)
		if @spots.include? number.to_s 
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

	def checkwinner(player)
		outer = 0
		# inner = 0
		@wincase.each do |outer|
			towin = 0
			outer.each do |winnum|
				towin += 1 if @spots[winnum-1] == player
			end
			return true if towin >= 3
		end
		# while outer <= 8 do
		# 	3towin = 0
		# 	while inner <= 3 do
				
		# 		3towin += 1 if @spots[@wincase[outer][inner]-1] == @player
		# 		inner += 1
		# 	end
		# 	return true if 3towin >= 3
		# 	outer += 1
		# end
		whosturn(@turn)
	end

	def win?
		true if checkwinner(@player) == true
	end

	def tie?
		return true if turn >= 9
	end
end



	
