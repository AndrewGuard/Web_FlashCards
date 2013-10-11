get '/' do
  erb :index
end

get '/deck/:id' do
  # @deck = deck.find(params[:id])
  erb :deck
end

get '/card/:id' do
  # @card = card.find(params[:id])
  erb :card
end

get '/login' do
  erb :login
end

get '/round' do
  # @round = round.find(params[:id])
  erb :round
end

# post '/round' do
#   @current_round = Round.create()

#   @current_round
# end
