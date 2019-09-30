class Restaurant < ApplicationRecord
    has_many :reservations
    has_many :reviews
    has_many :users, through: :reservations
end
