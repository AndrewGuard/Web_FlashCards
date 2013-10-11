class Guess < ActiveRecord::Base
  belongs_to :round
  belongs_to :user, through: :round
  belongs_to :deck, through: :round
end
