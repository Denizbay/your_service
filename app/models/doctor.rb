class Doctor < ApplicationRecord
  belongs_to :field
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :address, presence: true
  validates :description, presence: true
end
