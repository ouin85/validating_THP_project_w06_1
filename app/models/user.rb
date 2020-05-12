class User < ApplicationRecord
  after_create :welcome_send
  
  # Set association config
  has_many :attendances
  has_many :events, through: :attendances
  has_many :events, foreign_key: 'admin_id', class_name: 'Event'
  
  # Set validatios config
  validates :first_name,
  presence: true
  
  validates :last_name,
  presence: true
  
  validates :email,
  presence: true,
  uniqueness: true,
  format: { 
    with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: 'Please enter a valid email.'
  }
  
  private
  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end
end