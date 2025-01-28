class User < ApplicationRecord
    validates :username, presence: true, length: { minimum: 3, maximum: 64 }
    validates :email, format: {with: /[a-zA-Z0-9]@[a-zA-Z0-9].[a-zA-Z0-9]/}, length: { maximum: 500 }
    validates :password, presence: true, length: { minimum: 8, maximum: 64 }
    validates_uniqueness_of :username, :email

    has_many :sessions
    has_many :tweets
end
