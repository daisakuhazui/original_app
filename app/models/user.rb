class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :genres, through: :genre_users
  has_many :genre_users, dependent: :destroy

  mount_uploader :profile_image, ProfileUploader
  mount_uploader :cover_image, CoverUploader
end
