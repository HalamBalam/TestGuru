class User < ApplicationRecord
  has_and_belongs_to_many :tests
  has_many :created_tests, class_name: 'Test'
  
  validates :email, presence: true

  def passed_tests(level)
    tests.where(level: level)
  end
end
