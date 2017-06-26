class User < ApplicationRecord
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  before_save :normalize_email
  has_secure_password
  # relationships
  has_many :events
  has_many :guest_lists
  has_many :parties, through: :guest_lists, source: :event
  # validations
  validates :first_name, :last_name, :city, presence: true, length: {minimum: 2}
  validates :state, presence: true, length: {is: 2}
  validates :email, presence: true,  format: {with: EMAIL_REGEX}, uniqueness: true, case_sensitive: false
  validates :password, presence: true, length: {minimum: 8}
  #do I need a password_confirmation validation? no need if you have bcrypt
  def normalize_email
    self.email.downcase!
  end
end
