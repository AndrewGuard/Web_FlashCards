class Deck < ActiveRecord::Base
  belongs_to :round
  belongs_to :user
  has_many :cards

end
