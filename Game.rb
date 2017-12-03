require_relative "Player.rb"
require_relative "Board.rb"

class Game
	attr_accessor :board, :player, :code, :number_of_guesses

	def initialize
		@board = Board.new
		@player = Player.new
		@code = self.generate_code
		@number_of_guesses = 0
	end

	def generate_code
		code = []
		4.times do
			code.push(self.random_color)
		end
		code
	end

	def random_color
		colors = ["R", "G", "B", "Y", "P", "W"]
		color = colors[rand(6)]
	end

	def give_feedback(guess)
		same_color = 0
		same_color_place = 0
		code_count = {:R => 0, :G => 0, :B => 0, :Y => 0, :P => 0, :W => 0}
		guess_count = {:R => 0, :G => 0, :B => 0, :Y => 0, :P => 0, :W => 0}
		
		@code.each { |entry| code_count[entry.to_sym] += 1 }
		guess.each { |entry| guess_count[entry.to_sym] += 1 }

		["R", "G", "B", "Y", "P", "W"].each do |entry|
			code_entry_count = code_count[entry.to_sym]
			guess_entry_count = guess_count[entry.to_sym]
			if code_entry_count > 0
				if guess_entry_count > code_entry_count
					same_color += code_entry_count
				else
					same_color += guess_entry_count
				end
			end
		end
		@code.each_with_index do |entry, ind|
			if entry == guess[ind]
				same_color_place += 1
			end
		end
		puts same_color
		same_color = same_color - same_color_place

		return [same_color, same_color_place]

	end
end

game = Game.new
puts game.code

same_color = 0
same_color_place = 0
guess_count = 0
game_message = ""

is_game_over = false

while(!is_game_over)
	puts "What is your guess?"
	guess = game.player.make_guess
	same_color, same_color_place = game.give_feedback(guess)
	game.board.guesses[game.number_of_guesses] = guess
	game.number_of_guesses += 1
	game.board.draw_board
	puts "Correct color: #{same_color}   Correct color and place: #{same_color_place}"
	guess_count += 1
	if same_color_place == 4
		is_game_over = true 
		game_message = "You guessed the code!"
	elsif guess_count == 12
		is_game_over = true
		game_message = "Out of guesses, you lose =("
	end

end

puts game_message