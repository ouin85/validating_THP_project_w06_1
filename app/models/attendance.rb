class Attendance < ApplicationRecord
  # Set associations config
  belongs_to :user
  belongs_to :event
end
