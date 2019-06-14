class User < ApplicationRecord
  def passed_tests(level)
    Test.where(level: level).joins("INNER JOIN tests_users ON tests.id = tests_users.test_id").where("tests_users.user_id = ?", self.id)
  end
end
