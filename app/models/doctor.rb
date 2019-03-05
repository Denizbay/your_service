class Doctor < ApplicationRecord
  has_many :slots, dependent: :destroy
  has_many :bookings, through: :slots
  has_many :reviews, dependent: :destroy
  has_many :doctor_languages, dependent: :destroy
  has_many :languages, through: :doctor_languages
  belongs_to :field, optional: true

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :address, presence: true
  validates :description, presence: true
end
