class Guess < ActiveRecord::Base
  belongs_to :round
   has_one :user, through: :round
   has_one :card
end
