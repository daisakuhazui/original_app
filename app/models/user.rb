class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :questions, dependent: :destroy
  has_many :answers, dependent: :destroy
  has_many :genres, through: :genre_users, inverse_of: :user
  has_many :genre_users, dependent: :destroy

  mount_uploader :profile_image, ProfileUploader
  mount_uploader :cover_image, CoverUploader

  acts_as_followable
  acts_as_follower

  acts_as_taggable_on :skills, :interests

  def feed
    following_ids = "SELECT followable_id FROM follows WHERE follower_id = :user_id"
    Question.where("user_id IN (#{following_ids})", user_id: id)
  end
end
