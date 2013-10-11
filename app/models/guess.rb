class Guess < ActiveRecord::Base
  belongs_to :round
  belongs_to :user, through: :round
  belongs_to :card, through: :round
end
