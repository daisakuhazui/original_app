class Genre < ApplicationRecord
  has_many :users, through: :genre_users, inverse_of: :genre
  has_many :genre_users, dependent: :nullify
end
