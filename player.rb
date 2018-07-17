class Player #Class player defines a class for the players

attr_accessor :player_name, :symbol, :score 

	def initialize(player_name, symbol)
		@player_name = player_name
		@symbol = symbol
		@score = 0 #Init the score at 0
	end

	def counter #Method to count the number of wins by a player
		@score += 1 #Adds +1 everytime the method "counter" is called
	end

end
