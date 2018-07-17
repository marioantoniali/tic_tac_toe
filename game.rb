require_relative "board"
require_relative "player"

class Game 

  attr_accessor :ending, :turn

  def initialize(rules)
    @ending = false                 # initialise la fin du jeu
    @turn = Random.rand(0..1)       # choisit le premier joueur 
    @players = []                   # initialise et récupère les noms des joueurs
    puts " Veuillez entrer le nom du 1er joueur ( o ) "
    name = gets.chomp 
    @players.push(addPlayer(name,"o"))
    puts " Veuillez entrer le nom du 2eme joueur ( x )"
    name = gets.chomp 
    @players.push(addPlayer(name,"x"))
    @@cases = []
  end

  def altern                        # définit l'alternance entre les joueurs tour par tour
    if @turn == 0
      @turn += 1
      else @turn -= 1
    end
  end

  def action                        
    @board = Board.new
    begin
    
    puts "Bienvenue sur le TicTacToe lyonnais !"
    puts "Tape 1 pour jouer"
    puts "Tape 2 pour afficher les règles"
    puts "Tape 3 pour afficher les cases"
    puts "Tape 4 pour sortir du jeu"

    i = gets.chomp.to_i
    match_nul = false
    
    if    @@cases[0] == "x" && @@cases[1] == "x" && @@cases[2] == "x" || #verifie une victoire Horizontale pour
          @@cases[3] == "x" && @@cases[4] == "x" && @@cases[5] == "x" ||
          @@cases[6] == "x" && @@cases[7] == "x" && @@cases[8] == "x" ||
    
          @@cases[0] == "x" && @@cases[3] == "x" && @@cases[6] == "x" || #verfier une victoire verticale pour
          @@cases[1] == "x" && @@cases[4] == "x" && @@cases[7] == "x" ||
          @@cases[2] == "x" && @@cases[5] == "x" && @@cases[8] == "x" ||
    
          @@cases[0] == "x" && @@cases[4] == "x" && @@cases[8] == "x" || #verifier una victoire diagonale
          @@cases[2] == "x" && @@cases[4] == "x" && @@cases[6] == "x"
          return victory1 
    
    elsif @@cases[0] == "o" && @@cases[1] == "o" && @@cases[2] == "o" ||
          @@cases[3] == "o" && @@cases[4] == "o" && @@cases[5] == "o" ||
          @@cases[6] == "o" && @@cases[7] == "o" && @@cases[8] == "o" ||
    
          @@cases[0] == "o" && @@cases[3] == "o" && @@cases[6] == "o" ||
          @@cases[1] == "o" && @@cases[4] == "o" && @@cases[7] == "o" ||
          @@cases[2] == "o" && @@cases[5] == "o" && @@cases[8] == "o" ||
    
          @@cases[0] == "o" && @@cases[4] == "o" && @@cases[8] == "o" ||
          @@cases[2] == "o" && @@cases[4] == "o" && @@cases[6] == "o"
          return victory2
          else 
          return match_nul
          end

    if i == 1

      while result == match_nul  do

        puts "#{@players[@turn].player_name}, choisis une case."
        cases = gets.chomp.to_i
        while cases < 1 || cases > 9
          puts"Merci d'entrer un nombre entre 1 et 9"
          print ">"
          cases = gets.chomp.to_i
        end
        puts "#{@players[@turn].player_name} a choisi la case #{cases}"
        no_problem = @board.update_case(cases.to_i - 1, @players[@turn].symbol)  # update le fichier board avec les valeurs des cases
        
        @board.display

        if no_problem == 1
        altern
        else
        puts "Cette case est déjà prise, essaie encore !"
        end
      end
      while result == victory1 
        puts "x a gagné"
      end
      while result == victory2
        puts "o a gagné"
      end

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

  # def game_ending
	# 	# verifier si joueur avec symbol X a gagne
  #     if @cases[0] == "x" && @cases[1] == "x" && @cases[2] == "x" || #verifie une victoire Horizontale pour
  #  		 @cases[3] == "x" && @cases[4] == "x" && @cases[5] == "x" ||
  #  		 @cases[6] == "x" && @cases[7] == "x" && @cases[8] == "x" ||

  #  		 @cases[0] == "x" && @cases[3] == "x" && @cases[6] == "x" || #verfier une victoire verticale pour
  #      @cases[1] == "x" && @cases[4] == "x" && @cases[7] == "x" ||
  #      @cases[2] == "x" && @cases[5] == "x" && @cases[8] == "x" ||

  #      @cases[0] == "x" && @cases[4] == "x" && @cases[8] == "x" || #verifier una victoire diagonale
  #      @cases[2] == "x" && @cases[4] == "x" && @cases[6] == "x"
  #     puts "X a gagné"  

  #     elsif @cases[0] == "o" && @cases[1] == "o" && @cases[2] == "o" ||
  #      @cases[3] == "o" && @cases[4] == "o" && @cases[5] == "o" ||
  #      @cases[6] == "o" && @cases[7] == "o" && @cases[8] == "o" ||

  #      @cases[0] == "o" && @cases[3] == "o" && @cases[6] == "o" ||
  #      @cases[1] == "o" && @cases[4] == "o" && @cases[7] == "o" ||
  #      @cases[2] == "o" && @cases[5] == "o" && @cases[8] == "o" ||

  #      @cases[0] == "o" && @cases[4] == "o" && @cases[8] == "o" ||
  #      @cases[2] == "o" && @cases[4] == "o" && @cases[6] == "o"
  #     puts "Y a gagné"
  #     else 
  #       puts "Match nul"
  #     end
      
  

  def addPlayer(name,symbol)       # définit le joueur et son symbole
    player = Player.new(name,symbol)
    return player
end

end
game = Game.new("")
game.action
# game.game_ending