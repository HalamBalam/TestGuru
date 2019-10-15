class Badge < ApplicationRecord

  has_many :user_badges
  has_many :users, through: :user_badges

  validates :name, presence: true

  before_validation :before_validation_set_image, on: :create

  
  def category
    Category.find(category_id) unless category_id.nil?
  end

  def category=(new_category)
    if new_category.nil?
      self.category_id = nil
    else
      self.category_id = new_category.id
    end
  end

  private

  def before_validation_set_image
    self.image = 'badge.img'
  end

end
