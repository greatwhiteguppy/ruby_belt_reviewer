class Event < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :guest_lists
  validates :name, :date, :city, :state, presence: true
end
