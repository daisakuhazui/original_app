class Genre < ApplicationRecord
  has_many :users, through: :genre_users
  has_many :genre_users
end
