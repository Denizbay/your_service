class Slot < ApplicationRecord
  belongs_to :doctor
  validates :start_time, presence: true
  validates :duration, presence: true
  validates :weekday, presence: true
  validates :week_number, presence: true
end
