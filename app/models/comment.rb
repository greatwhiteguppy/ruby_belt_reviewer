class Comment < ApplicationRecord
  belongs_to :event
  validates :author, :text, presence: true
end
