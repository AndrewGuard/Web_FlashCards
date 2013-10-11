class Deck < ActiveRecord::Base
  belongs_to :round
  belongs_to :user, through: :rounds
  has_many :cards

end
