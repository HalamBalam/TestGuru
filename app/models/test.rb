class Test < ApplicationRecord
  
  belongs_to :category
  belongs_to :author, class_name: 'User', foreign_key: 'user_id'
  
  has_many :questions
  has_many :test_passages
  has_many :users, through: :test_passages
  
  before_destroy :before_destroy_delete_test_passages

  scope :easy, -> { where(level: 0..1) }
  scope :medium, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 5..Float::INFINITY) }
  
  scope :tests_by_category_title, -> (category_title) {
    joins("INNER JOIN categories ON categories.id = tests.category_id").where("categories.title=?", category_title).order('categories.title DESC')
  }

  validates :title, presence: true
  validates :level, numericality: { only_integer: true, greater_than: 0 }
  validates :title, uniqueness: { scope: :level }

  def self.test_names_by_category_title(category_title)
    tests_by_category_title(category_title).pluck(:title)
  end

  def question_number(question)
    index = self.questions.order(:id).index(question) || 0
    index += 1
  end

  private

  def before_destroy_delete_test_passages
    TestPassage.where(test: self).destroy_all  
  end

end
