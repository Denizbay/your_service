class Language < ApplicationRecord
  has_many :doctor_languages

  validates :name, presence: true
  has_many :doctors, through: :doctor_languages
end
