class Review < ApplicationRecord
  belongs_to :booking, dependent: :destroy
  belongs_to :doctor
  validates :stars, presence: true
end
