class Answer < ApplicationRecord
  belongs_to :question

  scope :correct_answers, -> { where(correct: true) }

  validates :body, presence: true
  validate :validate_answers_count

  def validate_answers_count
    errors.add(:base) if question.answers.count > 4
  end
end
