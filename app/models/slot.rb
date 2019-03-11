class Slot < ApplicationRecord
  # has_many :bookings
  has_one :booking
  belongs_to :doctor
  validates :start_time, presence: true
  validates :duration, presence: true
  validates :weekday, presence: true
  validates :week_number, presence: true

  validates :start_time, uniqueness: { scope: [:weekday, :week_number, :doctor_id] }

  def is_available?
    !self.booking
  end

  def pretty_time
    start_time.strftime('%H:%M')
  end

  def hour_position
    start_time.hour - 6
  end
end
