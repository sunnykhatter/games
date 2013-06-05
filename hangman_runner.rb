require_relative "hangman"

#figure out a random word to use for the game
class HangmanRunner

  # Starts the hangman game
  def self.run 
    @game = Hangman.new()
    while true
    	puts "\nBoard:"" #{@game.sboard}\n\n"
	    puts "Guessed letters: #{@game.guesses}\n\n"
	    puts "Chances: #{@game.chances}\n\n" 
	    puts "Already guessed" if @game.same == true
	    print "Take your best shot! Enter guess: "
	    letter = gets.chomp
	   

	    begin
	    	@game.guess(letter)
	    rescue Hangman::InvalidGuessException => e
	    	puts e.message
	    end

	    if @game.win?
	    	puts "\n\nCongratulations! You won! The word was #{@game.word}\n"
	    	break
	    elsif @game.lost?
	    	puts "\n\nYou lost. The word was #{@game.word}\n"	
	    	break
	    end
	    puts "+++++++++++++++++++++++++++++++++++++++++++++++++++\n"
    end
  end
end 

HangmanRunner.run