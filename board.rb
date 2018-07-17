require_relative "board_case"

class Board
    include Enumerable
    
    CASE_DEFAULT  = " "
    CASE_SYMBOL_1 = "x"
    CASE_SYMBOL_2 = "o"
    
    #attributs getter et setter réunis
    attr_accessor :cases
    
    # Initialisation d'un tableau de 9 cases contenant chacun un BoardCase
    def initialize
        @cases = Array.new(9){BoardCase.new}
        @victory1 = false
        @victory2 = false
        @victory3 = false
    end
    
    #Afficher la grille
    def display 
        puts "#{@cases[0].symbol}|#{@cases[1].symbol}|#{@cases[2].symbol}"
        puts "#{@cases[3].symbol}|#{@cases[4].symbol}|#{@cases[5].symbol}"
        puts "#{@cases[6].symbol}|#{@cases[7].symbol}|#{@cases[8].symbol}"
    end
    
    #Mise a jour de la case avec le symbole
    #Renvoie 1 si ok , 0 si erreur 
    def update_case(i, symbol)
        return @cases[i].update_symbol(symbol)
    end

    # Affichage des numeros de case
    def show_index
        puts "1|2|3"
        puts "4|5|6"
        puts "7|8|9"
    end
    
    # Fin de partie : Victoire ? Match null ?
    def game_ending
        
        # Toutes les cases ont été choisies
        @victory3 =
        !@cases[0].is_empty && !@cases[1].is_empty && !@cases[2].is_empty && 
        !@cases[3].is_empty && !@cases[4].is_empty && !@cases[5].is_empty && 
        !@cases[6].is_empty && !@cases[7].is_empty && !@cases[8].is_empty
        
        # verifier si joueur avec symbol X a gagne
        @victory1 = is_the_end(CASE_SYMBOL_1)
            
        # verifier si joueur avec symbol 0 a gagne
        @victory2 = is_the_end(CASE_SYMBOL_2)

        return @victory1 || @victory2 || @victory3
    end
    
    def is_the_end(symbol)
     return @cases[0].symbol == symbol && @cases[1].symbol == symbol && @cases[2].symbol == symbol || #verifie une victoire Horizontale pour
        @cases[3].symbol == symbol && @cases[4].symbol == symbol && @cases[5].symbol == symbol ||
        @cases[6].symbol == symbol && @cases[7].symbol == symbol && @cases[8].symbol == symbol ||
        
        @cases[0].symbol == symbol && @cases[3].symbol == symbol && @cases[6].symbol == symbol || #verfier une victoire verticale pour
        @cases[1].symbol == symbol && @cases[4].symbol == symbol && @cases[7].symbol == symbol ||
        @cases[2].symbol == symbol && @cases[5].symbol == symbol && @cases[8].symbol == symbol ||
        
        @cases[0].symbol == symbol && @cases[4].symbol == symbol && @cases[8].symbol == symbol || #verifier una victoire diagonale
        @cases[2].symbol == symbol && @cases[4].symbol == symbol && @cases[6].symbol == symbol
       
    end
    
    # Renvoie le symbole du gagant, vide sinon
    def get_symbole_winner        
        return CASE_SYMBOL_1 if @victory1
        return CASE_SYMBOL_2 if @victory2
        return CASE_DEFAULT 
    end    
end

