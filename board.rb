require_relative "board_case"

class Board
    include Enumerable
    #attributs getter et setter réunis
    attr_accessor :cases
    
    # Initialisation d'un tableau de 9 cases contenant chacun un BoardCase
    def initialize
        @cases = Array.new(9){BoardCase.new}
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
        @victory1 =
        @cases[0].symbol == "x" && @cases[1].symbol == "x" && @cases[2].symbol == "x" || #verifie une victoire Horizontale pour
        @cases[3].symbol == "x" && @cases[4].symbol == "x" && @cases[5].symbol == "x" ||
        @cases[6].symbol == "x" && @cases[7].symbol == "x" && @cases[8].symbol == "x" ||
        
        @cases[0].symbol == "x" && @cases[3].symbol == "x" && @cases[6].symbol == "x" || #verfier une victoire verticale pour
        @cases[1].symbol == "x" && @cases[4].symbol == "x" && @cases[7].symbol == "x" ||
        @cases[2].symbol == "x" && @cases[5].symbol == "x" && @cases[8].symbol == "x" ||
        
        @cases[0].symbol == "x" && @cases[4].symbol == "x" && @cases[8].symbol == "x" || #verifier una victoire diagonale
        @cases[2].symbol == "x" && @cases[4].symbol == "x" && @cases[6].symbol == "x"
        
        @victory2 = @cases[0].symbol == "o" && @cases[1].symbol == "o" && @cases[2].symbol == "o" ||
        @cases[3].symbol == "o" && @cases[4].symbol == "o" && @cases[5].symbol == "o" ||
        @cases[6].symbol == "o" && @cases[7].symbol == "o" && @cases[8].symbol == "o" ||
        
        @cases[0].symbol == "o" && @cases[3].symbol == "o" && @cases[6].symbol == "o" ||
        @cases[1].symbol == "o" && @cases[4].symbol == "o" && @cases[7].symbol == "o" ||
        @cases[2].symbol == "o" && @cases[5].symbol == "o" && @cases[8].symbol == "o" ||
        
        @cases[0].symbol == "o" && @cases[4].symbol == "o" && @cases[8].symbol == "o" ||
        @cases[2].symbol == "o" && @cases[4].symbol == "o" && @cases[6].symbol == "o"

        
        return @victory1 || @victory2 || @victory3
    end
    
    # Renvoie le symbole du gagant, vide sinon
    def get_symbole_winner        
        return "x" if @victory1
        return "o" if @victory2
        return "" 
    end    
end

