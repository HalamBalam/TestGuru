class User < ApplicationRecord
  def passed_tests(level)
    questions_id = Answer.where(user_id: @id).select(:question_id)
    tests_id = Question.where(id: questions_id).select(:test_id)
    Test.where(id: tests_id)
  end
end
