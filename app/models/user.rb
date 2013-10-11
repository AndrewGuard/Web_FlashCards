class User < ActiveRecord::Base
  validates :user_name, presence: true

  has_secure_password

  has_many :rounds
  has_one :deck, through: :round
  has_many :guesses, through: :round
end
