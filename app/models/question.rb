class Question < ApplicationRecord
  belongs_to :user
  has_many :pictures, as: :imageable, dependent: :destroy
  default_scope -> { order(created_at: :desc) }
end
