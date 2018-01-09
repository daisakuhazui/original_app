class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :genres, through: :genre_users, inverse_of: :user
  has_many :genre_users, dependent: :destroy

  mount_uploader :profile_image, ProfileUploader
  mount_uploader :cover_image, CoverUploader

  acts_as_followable
  acts_as_follower
end
