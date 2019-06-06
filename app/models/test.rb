class Test < ApplicationRecord
  def self.tests_by_category_title(category_title)
    categories_id = Category.where(title: category_title).select(:id)
    Test.where(category_id: categories_id).order('title DESC').select(:title)  
  end
end
