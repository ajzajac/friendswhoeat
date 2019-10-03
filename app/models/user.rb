class User < ApplicationRecord
    has_secure_password
    has_many :reservations
    has_many :restaurants, through: :reservations
    has_many :reviews
    has_many :followed_users, foreign_key: :follower_id, class_name: 'Follow'
    has_many :followees, through: :followed_users
    has_many :following_users, foreign_key: :followee_id, class_name: 'Follow'
    has_many :followers, through: :following_users
    validates :email, uniqueness: true
    
    acts_as_messageable

    def display_name
        "User #{display_name}"
    end

    def mailboxer_email(object)
        nil
    end


    def latest_reservations
        self.reservations.sort_by{|reservation| reservation.reservation_time }.last(5).reverse
    end


    def latest_reviews
        self.reviews.sort_by{|review| review.id }.last(5).reverse
    end

    # def password=(user_input)
    #     hashed_password = BCrypt::Password.create(user_input)
    #     self.update(password_digest: hashed_password)
    # end

    # def authenticate(user_input)
    #     BCrypt::Password.new(self.password_digest) == user_input
    # end
end