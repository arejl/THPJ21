# Le site des gossips !

#### Comment utiliser ce dossier ?

Lancer `$ bundle install` pour installer les gems nécessaires, puis lancer `$ shotgun -p 4567` pour mettre en place le serveur local.
Se rendre à l'adresse http://localhost:4567/ dans le navigateur pour accéder au site.

Les commentaires sont ajoutés et sauvegardés via une classe *Comment* et une base de données *comments.csv*. Les commentaires comprennent trois attributs, dont le dernier est le numéro du potin auquel ils sont rattachés.