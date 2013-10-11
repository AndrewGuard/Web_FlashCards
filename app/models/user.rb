class User < ActiveRecord::Base
  
  has_many :rounds
  has_one :deck, through: :round
  has_many :guesses, through: :round
end
