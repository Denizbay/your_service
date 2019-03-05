class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :slot
  has_one :review, dependent: :nullify
end


