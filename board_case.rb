class BoardCase
	attr_reader :symbol #permet de voir mais pas de modifier l'état symbole
	
	def initialize #définit l'état de boardcase à l'initialisation
		@symbol = Board::CASE_DEFAULT #case vide à l'initialisation du jeu en attente de symbole X ou O
	end

    # méthode qui met à jour le symbole
    # Si symbole déjà modifié --> renvoie une erreur
	def update_symbol(symbol) 
		if @symbol == Board::CASE_DEFAULT # vérifie si absence de symbole			
			@symbol = symbol # mise à jour du symbole
			return 1 #renvoie 1 si tout est ok
		else  
			return 0 #renvoie 0 si une erreur	
		end	
	end
		
	#renvoie true si vide ou false si présence symbole
    def is_empty
		return @symbol == Board::CASE_DEFAULT 
	end	
end		






