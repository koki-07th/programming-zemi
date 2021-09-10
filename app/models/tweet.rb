class Tweet < ApplicationRecord
<<<<<<< HEAD
  belongs_to :user
  validates :user_id, presence: true
  validates :content, presence: true, length: {maximum: 140 }
=======
    belongs_to :user
    validates :content, presence: true,
                        length: {maximum: 140 }
>>>>>>> 003a6a86eaa0dc910f09d3cb95fdc47fc4f02fc1
end
