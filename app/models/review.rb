class Review < ApplicationRecord
  belongs_to :booking
  belongs_to :doctor
 # validates :stars, presence: true
end
