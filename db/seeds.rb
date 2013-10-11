user = User.create(user_name: 'Jorge', password: '1')

deck = Deck.create(name: 'aces', user_id: user.id)

card = Card.create(question: 'What?', answer: 'Hells no', deck_id: deck.id)

round = Round.create(user_id: user.id, deck_id: deck.id)

guess = Guess.create(result: 'ok', round_id: round.id, card_id: card.id)
