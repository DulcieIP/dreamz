class Dream < ApplicationRecord
  belongs_to :user
  has_many :scenes
  validates :content, presence: true
  validates :content, length: { maximum: 1000 }

end
