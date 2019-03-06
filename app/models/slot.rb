class Slot < ApplicationRecord
  # has_many :bookings
  has_one :booking
  belongs_to :doctor
  validates :start_time, presence: true
  validates :duration, presence: true
  validates :weekday, presence: true
  validates :week_number, presence: true

  def is_available?
    !self.booking
  end

  def pretty_time
    start_time.strftime('%l:%M %p')
  end
end
