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
		
	end

end

game = Game.new
puts game.code

is_game_over = false

while(!is_game_over)
	puts "What is your guess?"
	guess = game.player.make_guess
	game.board.guesses[game.number_of_guesses] = guess
	#game.give_feedback
	game.number_of_guesses += 1
	game.board.draw_board


end

game.board.draw_board