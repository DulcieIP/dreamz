class Scene < ApplicationRecord
  belongs_to :dream
  validates :content, presence: true
end
