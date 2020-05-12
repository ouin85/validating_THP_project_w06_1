class Event < ApplicationRecord
  # Set associations config
  has_many :attendances
  has_many :users, through: :attendances
  belongs_to :admin, class_name: 'User'

  # Set validations config
  validates :start_date,
    presence: true,
    # See app/validators/not_in_past_validator.rb
    not_in_past: true

  validates :duration,
    presence: true,
    numericality: { greater_than: 0 }

  validates :title,
    presence: true,
    length: { in: 5..140 }

  validates :description,
    presence: true,
    length: { in: 20..1000 }

  validates :price,
    presence: true,
    numericality: { greater_than: 0, less_than: 1001 }

  validates :location,
    presence: true

  validate :duration_multiple_of_5

  private
  def duration_multiple_of_5
    errors.add(:duration, 'must be multiple of 5') unless !duration || duration % 5 == 0
  end
end
