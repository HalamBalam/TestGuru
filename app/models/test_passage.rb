class TestPassage < ApplicationRecord
  PERCENT_FOR_PASSING_TEST = 85

  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_first_question, on: :create
  before_validation :before_validation_set_elapsed_time, on: :create

  scope :user_passages, -> (user) { where(user: user) }
  scope :user_passages_for_test, -> (user, test) { where(user: user, test: test) }

  def completed?
    current_question.nil?
  end

  def accept!(answer_ids)
    return if completed?

    if correct_answer?(answer_ids || [])
      self.correct_questions += 1
    end
    
    self.current_question = next_question
    save!
  end

  def test_passed?
    return true if test.questions.count == 0
    return false if self.elapsed_time == 0.0
    
    percent = self.correct_questions / test.questions.count * 100
    percent >= PERCENT_FOR_PASSING_TEST
  end

  private

  def before_validation_set_first_question
    self.current_question = test.questions.first if test.present?
  end

  def before_validation_set_elapsed_time
    self.elapsed_time = test.time if test.present?
  end

  def correct_answer?(answer_ids)
    correct_answers.ids.sort == answer_ids.map(&:to_i).sort
  end

  def correct_answers
    current_question.answers.correct_answers
  end

  def next_question
    test.questions.order(:id).where('id > ?', current_question.id).first
  end

end
