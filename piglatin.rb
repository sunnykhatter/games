def piglatin(eword)
	vowels = [ "a" , "e", "i", "o", "u"]
	output  = ""
	target = -1
	i = -1
	unless output != ""
		target+=1
		until i == vowels.size
				i+=1
			output = vowels[i] if eword[target] == vowels[i]
		end
	end
    if eword !=""
		teststring = eword.slice!(0..target) + "ay" 
		puts eword.slice(target..eword.length) + teststring
	end
end


puts "Enter an english word " 
eword = gets.chomp
piglatin(eword)




