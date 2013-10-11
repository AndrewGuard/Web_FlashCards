get '/' do
  erb :index
end

#--------login---------#

get '/login' do
  erb :login
end

#--------deck---------#

get '/deck/:id' do
  @deck = Deck.find(params[:id])
  erb :deck
end

#--------card---------#

get '/card/:id' do
  @card = Card.find(params[:id])
  erb :card
end

#--------rounds---------#

get '/createround/:deck_id' do
  deck = Deck.find(params[:deck_id])
  # TODO ----- Interpolate user_id
  new_round = Round.create(user_id: 1, deck_id: deck.id)

  redirect to "/round/#{new_round.id}"
end

get '/round/:id' do
  @current_round = Round.find(params[:id])  
  erb :round
end

# --------edit-----------#

get '/edit' do
  erb :edit
end
