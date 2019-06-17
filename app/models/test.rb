class Test < ApplicationRecord
  belongs_to :category
  has_many :questions
  has_and_belongs_to_many :users
  belongs_to :author, class_name: 'User', foreign_key: 'user_id'
  
  def self.tests_by_category_title(category_title)
    Test.joins("INNER JOIN categories ON categories.id = tests.category_id").where("categories.title=?", category_title).order('categories.title DESC').pluck(:title) 
  end 
end
