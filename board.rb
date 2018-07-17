require_relative "board_case"

class Board
    include Enumerable
    #attributs getter et setter réunis
    attr_accessor :cases
    
    
    def initialize
        @cases = Array.new(9){BoardCase.new } #création de l'array
        #on remplit le tableau case par case mais => @cases.fill(BoardCase.new) ne fonctionne pas car .fill méthode remplit toutes les cases à l'identique
    end
    
    #Afficher le quadrillage
    def display
        #a chaque index on appelle l'attribut symbol du fichier board_case.rb
        puts "#{@cases[0].symbol}|#{@cases[1].symbol}|#{@cases[2].symbol}"
        puts "#{@cases[3].symbol}|#{@cases[4].symbol}|#{@cases[5].symbol}"
        puts "#{@cases[6].symbol}|#{@cases[7].symbol}|#{@cases[8].symbol}"
    end
    
    #Mettre à jour le board avec nouvelles entrées de chaque tour
    def update_case(i, symbol)
        #renvoie l'index de la case choisie et utilise methode update de board_case pour le symbol
        return @cases[i].update_symbol(symbol)
    end
    
    def show_index
        #on explique au joueur le numéro de chaque case
        puts "1|2|3"
        puts "4|5|6"
        puts "7|8|9"
    end
    
    def game_ending
        
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
    
    def get_symbole_winner
                
        return "x" if @victory1
        return "o" if @victory2
        return "" 
    end    
end

