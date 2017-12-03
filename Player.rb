class Player

	def initialize
		
	end

	def make_guess
		
		guess = []

		loop do
			guess = gets.chomp.upcase.split(" ")
			entry_is_good = true

			if guess.length != 4
				puts "Must enter 4 colors"
				entry_is_good = false
			elsif !guess.reduce(true) {|in_colors, entry| in_colors && (/R|G|B|Y|P|W/.match(entry)) } 
				puts "All entries must be R|G|B|Y|P|W"
				entry_is_good = false
			end
			break if(entry_is_good)
		end
		guess
	end

end