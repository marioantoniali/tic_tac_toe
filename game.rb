require_relative "board"
require_relative "player"

class Game
        
    def initialize
        @turn = Random.rand(0..1)       # choisit le premier joueur
        # initialise et récupère les noms des joueurs
        @players = []                  
        puts " Veuillez entrer le nom du 1er joueur ( #{Board::CASE_SYMBOL_1} ) :"
        name = gets.chomp.capitalize
        @players.push(add_player(name,Board::CASE_SYMBOL_1))
        puts " Veuillez entrer le nom du 2ème joueur ( #{Board::CASE_SYMBOL_2} ) :"
        name = gets.chomp.capitalize
        @players.push(add_player(name,Board::CASE_SYMBOL_2))
    end
    
    # lance le jeu après avoir créé les 2 joueurs
    def action
        @board   = Board.new # Crée le tableau

        begin
            puts "----------- MENU ----------------"
            puts "Tape 1 pour jouer"
            puts "Tape 2 pour afficher les règles"
            puts "Tape 3 pour afficher les cases"
            puts "Tape 4 pour sortir du jeu"
            puts "---------------------------------"
            print "Votre choix : "

            item_menu = gets.chomp.to_i
            continue = true #définition variable permettant de continuer le jeu tant que continue = true
            
            if item_menu == 1 # on joue 
                
                puts "----- Début du Jeu ---- "    
                begin 
                    print "#{@players[@turn].player_name}(#{@players[@turn].symbol}), choisis une case : " #annonce le joueur qui doit jouer en fonction du tour
                    case_selected = gets.chomp.to_i 
                    
                    while case_selected < 1 || case_selected > 9 #le joueur doit choisir un chiffre entre 1 et 9 sinon on renvoie le message ci-dessous
                        puts"Merci d'entrer un nombre entre 1 et 9"
                        print ">"
                        case_selected = gets.chomp.to_i
                    end
                    
                    puts "#{@players[@turn].player_name} a choisi la case #{case_selected}" 
                    
                    no_problem = @board.update_case(case_selected - 1, @players[@turn].symbol)  # vérifie si la case est disponible
                    
                    @board.display #affiche le tableau après chaque tour
                    
                    if @board.game_ending #détermine le gagnant potentiel
                                        
                        if(@board.get_symbole_winner == @players[0].symbol)
                            puts "#{@players[0].player_name} a gagné"
                        elsif(@board.get_symbole_winner == @players[1].symbol)
                            puts "#{@players[1].player_name} a gagné"
                        else
                            puts " Match terminé, pas de gagnant"
                        end
                        
                        continue = false
                        @board = Board.new # réinitialise un nouveau tableau si la partie est terminée
                        break
                    else
                        if no_problem == 1 #la case est disponible et le jeu n'est pas encore terminé
                            altern
                        else
                           puts "Cette case est déjà prise, essaie encore !"    
                        end
                    end                     
                end while(continue) #fin de begin
                
            elsif item_menu == 2
                puts "Il y a deux joueurs; l’un joue avec le signe x et l’autre avec le signe o. Les deux joueurs remplissent alternativement les cases vides. Au début du jeu, il y a 9 cases vides dans un tableau 3x3. Le but est de placer 3 signes identiques sur une colonne, une ligne ou une diagonale. Le jeu prend fin lorsque l'un des 2 joueurs gagne ou si le tableau est entièrement rempli ce qui signifie qu'aucun joueur n’est arrivé à atteindre le but. Bonne chance !\n\n"
                
            elsif item_menu == 3
                @board.show_index            # affiche le tableau avec le nom des cases
                puts "\n"     
            elsif item_menu == 4  
            else
              puts "Mauvaise commande, recommence !"  
            end
               
        end while item_menu != 4
        
    end
    
    # Méthodes privées        
    private
            
     # définit l'alternance entre les joueurs tour par tour
    def altern                       
        if @turn == 0
            @turn += 1
            else @turn -= 1
        end
    end        
    
    def add_player(name,symbol)       # définit le joueur et son symbole
        player = Player.new(name,symbol)
        return player
    end
    
end

def perform
 puts "Bienvenue sur le TicTacToe lyonnais !"   
 game = Game.new
 game.action
end
        
# Lancement du jeu        
perform        


