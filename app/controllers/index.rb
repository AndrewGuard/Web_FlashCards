get '/' do
  erb :index
end

get '/deck/:id' do
  # @deck = deck.find(params[:id])
  erb :deck
end


#--------login---------#


get '/card/:id' do
  # @card = card.find(params[:id])
  erb :card
end

#--------login---------#

get '/login' do
  erb :login
end

#--------rounds---------#

get '/round' do
  erb :round
end



post '/createround/:deck_id' do
  @deck = Deck.find(params[:deck_id])
  
  @current_round = Round.create()

  @current_round
end


