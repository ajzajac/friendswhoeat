class Review < ApplicationRecord
belongs_to :restaurant
belongs_to :user
has_one_attached :image
end
