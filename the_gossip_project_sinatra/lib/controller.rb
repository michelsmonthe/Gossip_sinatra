
require 'gossip'
require 'csv'

class ApplicationController < Sinatra::Base


  get '/' do
    erb :index
  end

  get '/gossips/new/' do
    erb :new_gossip
  end

  post '/gossips/new/' do
    puts "Ce programme ne fait rien pour le moment, on va donc afficher un message dans le terminal"
    Gossip.new(params["gossip_author"],params["gossip_content"]).save
    redirect '/'
  end


end
