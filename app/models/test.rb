class Test < ApplicationRecord
  def self.tests_by_category_title(category_title)
    Test.joins("INNER JOIN categories ON categories.id = tests.category_id").where("categories.title=?", category_title).order('categories.title DESC').pluck(:title) 
  end
end
