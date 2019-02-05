class Gossip < ApplicationRecord
  belongs_to :user
  validates :title, presesnce: true, length: { in: 6..20 }
  validates :content , presesnce: true
  has_many :tags
end
