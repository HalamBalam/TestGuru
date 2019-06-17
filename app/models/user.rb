class User < ApplicationRecord
  has_and_belongs_to_many :tests
  has_many :created_tests, class_name: 'Test'
  
  def passed_tests(level)
    Test.where(level: level).joins("INNER JOIN tests_users ON tests.id = tests_users.test_id").where("tests_users.user_id = ?", self.id)
  end
end
