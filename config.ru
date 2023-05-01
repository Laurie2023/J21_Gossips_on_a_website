#Fichier contenant les informations nécessaires au lancement de notre serveur. 

require 'sinatra'

#permet d'appeler le fichier 'controller' dans le dossier 'lib'
$:.unshift File.expand_path("./../lib", __FILE__) 
require 'controller'

run ApplicationController