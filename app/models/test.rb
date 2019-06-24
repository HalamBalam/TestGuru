class Test < ApplicationRecord
  belongs_to :category
  has_many :questions
  has_and_belongs_to_many :users
  belongs_to :author, class_name: 'User', foreign_key: 'user_id'

  scope :easy, -> { where(level: 0..1) }
  scope :medium, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 5..Float::INFINITY) }
  
  scope :tests_by_category_title, -> (category_title) {
    joins("INNER JOIN categories ON categories.id = tests.category_id").where("categories.title=?", category_title).order('categories.title DESC')
  }

  scope :passed_tests, -> (user, level) {
    where(level: level).joins("INNER JOIN tests_users ON tests.id = tests_users.test_id").where("tests_users.user_id = ?", user.id)
  }

  validates :title, presence: true
  validates :level, numericality: { only_integer: true, greater_than: 0 }
  validates :title, uniqueness: { scope: :level }
end
