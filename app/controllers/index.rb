get '/' do
  erb :index
end

# --------edit-----------#

get '/edit' do
  erb :edit
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
    round = Round.find(params[:id])
    deck ||= Deck.find(round.deck_id)
    card_array = deck.cards
    
    redirect to "/round/#{round.id}/#{card_array.sample.id}"
end

get "/round/:round_id/:card_id" do
  @card = Card.find_by_id(params[:card_id])
  @current_round = Round.find_by_id(params[:round_id])
  erb :round
end

# --------guess-----------#

post "/guess/:round_id/:card_id" do
  #CREATE CORRECT METHOD FOR CARD
  new_guess = Guess.new(round_id: params[:round_id], card_id: params[:card_id])
  @round_now = Round.find(params[:round_id])
  @card_array = @round_now.deck.cards
  @card = Card.find(params[:card_id])

  if params[:answer] == @card.answer
    new_guess.result = true
    new_guess.save
    redirect to "/round/#{@round_now.id}/#{@card_array.sample.id}"
  else
    new_guess.result = false
    new_guess.save
    redirect to "/"#round/{@round_now.id}/#{params[:card_id]}"
  end
end

# --------resluts--------#
get "/results" do
  "FUCK YOUUUUUU"
end
