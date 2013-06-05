class Hangman
	LIST = ["canada", "england", "australia", "japan"]
  attr_accessor :word, :chances, :board, :list, :guesses, :answer, :sboard, :same

  class InvalidGuessException < Exception
  end

  def initialize()
    @chances = 8
    @guesses = []
    @word    = LIST.sample
    @board   = draw_board(@word)
    @sboard = spaced_board(@board)
    @same = false
  end
  
  # return @guesses as a string
  def guesses
  	@guesses.to_s
  end
  
  # return a string of underscores equal to length of the given word
  def draw_board(word)
    count = 0
    string = ""
    while count < word.length
    	count+=1
    	string += "_"
    end
    return string
  end

  def spaced_board(board)
    @sboard = board.scan(/.{1}/).join(' ')
  end

  # return true if word has letter
  def word_has?(letter)
  	@word.include? letter
  end

  # replace indexes of @board with letter where the same indexes of @word are letter
  # in other words, if @board is _ _ _ _ _ _ and @word is canada
  # and the letter guessed is a
  # then @board should become _ a _ a _ a
  def put_letter_on_board(letter)
  	
  	@board.split('').each_with_index do |x, index|
  		@board[index] = letter if @word[index] == letter
  	end

    @guesses << letter if !@guesses.include? letter
    spaced_board(@board)
  end

  # decrement # of chances and add letter to guesses
  def wrong_letter(letter)
  	@chances = @chances - 1
  	@guesses << letter 
  end

  #check if the letter has already been used 
  def set_same()
  	@same = true
  end

  def default_same()
    @same = false
  end

  def valid_guess(letter)
    letter.length == 1 && letter[/[a-zA-Z0-9]+/] == letter
  end
  
  # if the word has the given letter, put it on the board, otherwise, it's a wrong guess
  def guess(letter)
    default_same()
    if !valid_guess(letter)
      raise InvalidGuessException.new("Invalid Guess!") 
    elsif @guesses.include? letter
      set_same()
    elsif word_has?(letter)
    	put_letter_on_board(letter)
    else
      wrong_letter(letter)
    end
  end

  # return true if @board doesn't have a '_', otherwise return false
  def win?
    unless @board.include? "_"
      true 
    end
  end

  # return true if @chances is 0, otherwise return false
  def lost?
    if @chances == 0
    	true
    end
  end


end




