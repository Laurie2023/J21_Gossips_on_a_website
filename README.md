# Présentation du programme
Reprise du programme The Gossip Project et implémentation dans une application web, grâce à la gem Sinatra. 

L'application comprend : 
- Une page d'accueil,
- Une page pour chaque potin,
- Un formulaire de création de potin,
- Un formulaire de création de commentaire. 

Il est possible de voir tous les potins sur la page d'accueil et les commentaires correspondant à chaque potin sur la page du potin ciblé. 
A noter qu'il est possible de modifier un potin déjà présent dans la base de données. 

# Architecture du programme 
- 1 fichier Controller (ruby),
- 2 fichiers Model (ruby) : un pour les potins et l'autre pour les commentaires, 
- 5 fichiers View (ruby) : l'accueil, les page de chaque potin, la page d'ajout d'un nouveau potin, la page d'ajout d'un nouveau commentaire et la page de modification d'un potin,
- 2 fichiers Base de données (csv) : une pour stocker les potins et l'autre pour les commentaires. 

Website : http://localhost:4567

# Gemfile
source "https://rubygems.org"
ruby '3.0.0'
gem 'http'
gem 'sinatra'
gem 'csv'
gem 'rerun'

# Auteur.e
Laurie.B