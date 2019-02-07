class Comment < ApplicationRecord
 belongs_to :gossip , dependent: :destroy
end
