
require 'gossip'
#require 'csv'

class ApplicationController < Sinatra::Base


  get '/' do
    erb :index, locals: {gossips: Gossip.all}
  end

  get '/gossips/new/' do
    erb :new_gossip
  end

  post '/gossips/new/' do #sauvegarde
    puts "Ce programme ne fait rien pour le moment, on va donc afficher un message dans le terminal"
    Gossip.new(params["gossip_author"],params["gossip_content"]).save
    redirect '/'
  end

  get '/gossips/:id' do #id dynamique
    	erb :show, locals: {id: params['id'].to_i, gossips: Gossip.find(params['id'].to_i)}
  end

  get '/gossips/:id/edit/' do
    		erb :edit, locals: {id: params['id'].to_i, gossips: Gossip.find(params['id'].to_i)}
  end

  post '/gossips/:id/edit/' do
    		Gossip.update(params['id'], params["gossip_author"], params["gossip_content"])
    		redirect '/'
    	end



end
