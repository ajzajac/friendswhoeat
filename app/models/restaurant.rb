class Restaurant < ApplicationRecord
    has_many :reservations
    has_many :reviews
    has_many :users, through: :reservations

    def average_rating
        @reviews = Review.all.select { |review| review.restaurant == self}
        if reviews != []
        @ratings = @reviews.map { |review| review.rating }
        (@ratings.reduce(:+).to_f / @ratings.size).round(1)
        else
            "No Ratings Yet"
        end

      end


end
