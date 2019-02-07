class Gossip < ApplicationRecord
  validates :title, presence: true, length: { in: 3..50 }
  validates :content , presence: true
  belongs_to :user
  has_many :tags
  has_many :comments, dependent: :destroy
end
