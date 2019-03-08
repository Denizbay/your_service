class Doctor < ApplicationRecord

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?


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

  include PgSearch

  pg_search_scope :global_search,
    against: [:address],
    associated_against: {
      languages: [:name],
      field: [:name]
    },
    using: {
      tsearch: { prefix: true }
    }


  def week_slots(week_no)
    slots.where(week_number: week_no, weekday: Date.current.cwday).order(:start_time)
  end
end
