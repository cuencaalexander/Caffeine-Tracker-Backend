class User < ApplicationRecord
    has_many :user_drinks, dependent: :destroy
    has_many :drinks, through: :user_drinks
end