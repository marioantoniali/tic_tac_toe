
class BoardCase
	attr_reader :symbol #permet de voir mais pas de modifier l'état symbole
	
	def initialize #definit l'état de boardcase à l'initialisation
		@symbol = " " #case vide à l'initialisation du jeu en attente de symbole X, O, 
					  #un espace est nescessaire pour inclure le symbole
	end

	def update_symbol(symbol) #méthode pour définir si la case a un symbole
		if @symbol == " " #verifie si absence de symbole
			
			@symbol = symbol #état après apparition d'un symbole
			return 1 #renvoie 1 si tout est ok
		else  
			return 0 #renvoie 0 si une erreur	
		end	
	end
		
	def is_empty #si la case est vide
		return @symbol == " " #renvoie true si vide ou false si présence symbole
	end	
end		






