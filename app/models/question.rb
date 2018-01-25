class Question < ApplicationRecord
  belongs_to :user
  has_many :pictures, as: :imageable, dependent: :destroy
  default_scope -> { order(created_at: :desc) }

  def feed_answers
    answer_ids = "SELECT id FROM answers WHERE  question_id = :question_id"
    Answer.where("id IN (#{answer_ids})", question_id: id)
  end
end
