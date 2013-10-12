get '/' do
  erb :index
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

  @counter = params[:counter] || 0
  @current_round = Round.find(params[:id])
    @deck ||= Deck.find(@current_round.deck_id)
    unless @counter >= @deck.cards.length
    @card = @deck.cards[@counter]
    erb :round
    end
end

# --------edit-----------#

get '/edit' do
  erb :edit
end

# --------guess-----------#

post '/guess/:round_id/:card_id' do
  #CREATE CORRECT METHOD FOR CARD
  @guess = Guess.create(result: Card.find(params[:card_id].to_i).correct?(params[:answer]), 
                        round_id: params[:round_id], 
                        card_id: params[:card_id])
  @counter = @guess.id
  redirect to "/round/#{params[:round_id]}/?counter=#{@guess.id}"
end

# --------resluts--------#
get "/results" do
  "FUCK YOUUUUUU"
end
