class Scene < ApplicationRecord
  belongs_to :dream
  validates :content, presence: true
  has_one_attached :image
end
