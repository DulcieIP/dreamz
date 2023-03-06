class Dream < ApplicationRecord
  belongs_to :user
  has_many :scenes
  validates :content, presence: true
end
