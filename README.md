## Morpion / Tic Tac Toe

Le jeu se lance via `$ ruby app.rb`
Le texte du jeu est colorisé avec la gem `lolize`.

La classe *Application* désigne l'ensemble des parties que l'on va jouer. Elle comprend donc le script pour le début de partie (récupération du nom des joueurs), la réalisation d'une partie, et la méthode qui demande à l'utilisateur s'il veut rejouer.

La classe *Game* désigne une seule partie. Elle comprend les méthodes pour choisir la case à remplir, vérifier que la partie est toujours en cours, et annoncer le vainqueur.

La classe *Board* comprend toute la structure de la grille, et la méthode pour remplir une case.

La classe *Boardcase* initialise les cases de la grille individuellement.

La classe *Player* initialise les joueurs.