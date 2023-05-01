require 'sinatra'
require 'models/gossip.rb'
require 'models/comments.rb'
require 'rerun'

class ApplicationController < Sinatra::Base
  #Page d'accueil ----------------------------------------------------------------------
  get '/' do
    erb :index, locals: {gossips: Gossip.all} 
    #local permet d'envoyer l'array de gossip.all vers la view ciblée
  end

  #Page création d'un nouveau gossip ---------------------------------------------------
  get '/gossips/new/' do
    erb :new_gossip 
  end

  #Summit => enregistrement & redirection vers l'accueil -------------------------------
  post '/gossips/new/' do
    Gossip.new(params["gossip_author"], params["gossip_content"]).save
    redirect '/' #redirection vers l'accueil
  end

  #Page par gossip ---------------------------------------------------------------------
  get '/:id' do
    erb :one_gossip, locals: {id:params['id'], a_gossip: Gossip.find(params['id']), comments:Comment.all} 
  end

  #Editer un gossip en particulier -----------------------------------------------------
  get '/:id/edit' do
    erb :edit, locals: {id:params['id'], a_gossip: Gossip.find(params['id'])}
  end 

  #Summit => enregistrement de la modification & redirection l'accueil -----------------
  post '/:id/edit' do
    Gossip.new(params["gossip_author"], params["gossip_content"]).update(params['id'])
    redirect '/'
  end

  #Page création d'un nouveau commentaire ----------------------------------------------
  get '/:id/newcomment' do
    erb :new_comment, locals: {id:params['id'], a_gossip: Gossip.find(params['id'])}
  end

  #Summit => enregistrement d'un nouveau commentaire -----------------------------------
  post '/:id/newcomment' do
    Comment.new(params['id'],params["comment_content"], params["comment_author"]).save
    redirect '/'
  end
end