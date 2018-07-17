require_relative "board"
require_relative "player"

class Game
    
    attr_accessor :ending, :turn
    
    def initialize(rules)
        @ending = false                 # initialise la fin du jeu
        @turn = Random.rand(0..1)       # choisit le premier joueur
        @players = []                   # initialise et récupère les noms des joueurs
        puts " Veuillez entrer le nom du 1er joueur ( o ) :"
        name = gets.chomp.capitalize
        @players.push(add_player(name,"o"))
        puts " Veuillez entrer le nom du 2ème joueur ( x ) :"
        name = gets.chomp.capitalize
        @players.push(add_player(name,"x"))
    end
    
    # définit l'alternance entre les joueurs tour par tour
    def altern                       
        if @turn == 0
            @turn += 1
            else @turn -= 1
        end
    end
    
    # lance le jeu après avoir créé les 2 joueurs
    def action
        @board = Board.new # Créé le tableau
        begin
            
            puts "Bienvenue sur le TicTacToe lyonnais !"
            puts "Tape 1 pour jouer"
            puts "Tape 2 pour afficher les règles"
            puts "Tape 3 pour afficher les cases"
            puts "Tape 4 pour sortir du jeu"
            
            i = gets.chomp.to_i
            
            continue = true #definition variable permettant de continuer le jeu tant que continue = true
            
            if i == 1
                begin 
                    
                    puts "#{@players[@turn].player_name}, choisis une case." #annonce le joueur qui doit jouer en fonction du tour
                    cases = gets.chomp.to_i 
                    while cases < 1 || cases > 9 #le joueur doit choisir un nbre entre 1 et 9 sinon on renvoit le message en dessous
                        puts"Merci d'entrer un nombre entre 1 et 9"
                        print ">"
                        cases = gets.chomp.to_i
                    end
                    puts "#{@players[@turn].player_name} a choisi la case #{cases}" 
                    no_problem = @board.update_case(cases.to_i - 1, @players[@turn].symbol)  # verifie si la case est disponible
                    
                    @board.display #affiche le tableau apres chaque tour
                    
                    if @board.game_ending #determine le gagnant potentiel
                                        
                        if(@board.get_symbole_winner == @players[0].symbol)
                            puts "#{@players[0].player_name} a gagné"
                        elsif(@board.get_symbole_winner == @players[1].symbol)
                            puts "#{@players[0].player_name} a gagné"
                            else
                            puts " Match teminé pas de gagnant"
                        
                        end
                        
                        continue = false
                        @board = Board.new # réinitialise un nouveau tableau si partie terminee

                    break
                    else
                        
                        if no_problem == 1 #la case est disponible et le jeu est pas encore termine
                        altern
                    else
                        puts "Cette case est déjà prise, essaie encore !"
                        
                    end
                        
                    end    
                    
                    
                    
                end while(continue) #fin de begin
                
            elsif i == 2
            puts "Il y a deux joueurs; l’un joue avec le signe x et l’autre avec le signe o. Les deux joueurs remplissent alternativement les cellules vides. Au début du jeu, il y a 9 cellules vides dans un panneau 3x3. Le but est de placer 3 signes identiques sur une colonne, une ligne ou une diagonale. Le jeu prend fin si le panneau est entièrement rempli et si aucun joueur n’arrive à atteindre le but. Bonne chance !\n\n"
                
            elsif i == 3
            @board.show_index            # affiche le tableau avec le nom des cases
            puts "\n"
                
            elsif i == 4
                
            else
            puts "Mauvaise commande, recommence !"
                
            end
        end while i != 4
        
    end
    
    def add_player(name,symbol)       # définit le joueur et son symbole
        player = Player.new(name,symbol)
        return player
    end
    
end
game = Game.new("")
game.action

