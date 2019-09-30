class User < ApplicationRecord
    has_many :reservations
    has_many :restaurants, through: :reservations
    has_many :reviews
    has_many :restaurants, through: :reviews
    # has_many :followed_users, class_name: ‘Follow’, foreign_key: :follower_id
    # has_many :followees, through: :followed_users
    # has_many :following_users, class_name: ‘Follow’, foreign_key: :followee_id
    # has_many :followers, through: :following_users
    # has_secure_password
    # def password=(user_input)
    #     hashed_password = BCrypt::Password.create(user_input)
    #     self.update(password_digest: hashed_password)
    # end

    # def authenticate(user_input)
    #     BCrypt::Password.new(self.password_digest) == user_input
    # end
end
