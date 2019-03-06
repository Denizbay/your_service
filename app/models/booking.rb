class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :slot
  has_one :review, dependent: :nullify

  def date
    Date.commercial(Date.today.year, slot.week_number, slot.weekday)
  end

  def time
    slot.start_time.strftime(' %l %M %p')
  end
end


