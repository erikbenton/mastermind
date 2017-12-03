class Board
	attr_accessor :guesses

	def initialize
		@guesses = [[" "," "," "," "],
								[" "," "," "," "],
								[" "," "," "," "],
								[" "," "," "," "],
								[" "," "," "," "],
								[" "," "," "," "],
								[" "," "," "," "],
								[" "," "," "," "],
								[" "," "," "," "],
								[" "," "," "," "],
								[" "," "," "," "],
								[" "," "," "," "]]
	end

	def draw_board
		puts " ---------------"
		@guesses.each do |row|
			print "|"
			row.each do |entry|
				print " #{entry} |"
			end
			puts ""
			puts " ---------------"
		end
	end

end