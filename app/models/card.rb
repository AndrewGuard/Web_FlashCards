class Card < ActiveRecord::Base
  
  belongs_to :deck


  def correct?(guess)
    guess == self.answer
  end
end
