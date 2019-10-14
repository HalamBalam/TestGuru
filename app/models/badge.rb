class Badge < ApplicationRecord

  has_many :user_badges
  has_many :users, through: :user_badges

  validates :name, presence: true

  before_validation :before_validation_set_image, on: :create

  class << self

    def give_badges(user, test_passage)
      Badge.all.each do |badge|
        if badge.category.present?
          give_badge_for_category(user, badge, test_passage) 
        elsif badge.first_attempt
          give_badge_for_first_attempt(user, badge, test_passage)
        elsif badge.level.to_i > 0
          give_badge_for_level(user, badge, test_passage)
        end
      end    
    end

    def give_badge_for_category(user, badge, test_passage)
      return if test_was_passed_earlier?(user, test_passage)

      if all_tests_passed?(user, badge.category.tests)
        give_badge_to_user(user, badge)
      end
    end

    def give_badge_for_first_attempt(user, badge, test_passage)
      return if test_was_passed_earlier?(user, test_passage)
      
      give_badge_to_user(user, badge)  
    end

    def give_badge_for_level(user, badge, test_passage)
      return if test_was_passed_earlier?(user, test_passage)

      if all_tests_passed?(user, Test.where(level: badge.level))
        give_badge_to_user(user, badge)
      end  
    end

    def give_badge_to_user(user, badge)
      user_badge = UserBadge.new(user: user, badge: badge)
      user_badge.save!  
    end

    def all_tests_passed?(user, tests)
      passed_tests = []
      TestPassage.user_passages(user).where(test: tests).each do |test_passage|
        if test_passage.test_passed?
          passed_tests << test_passage.test  
        end
      end

      passed_tests.uniq!

      return tests.count == passed_tests.count
    end

    def test_was_passed_earlier?(user, test_passage)
      TestPassage.user_passages(user).where(test: test_passage.test).each do |user_test_passage|
        return true if user_test_passage.test_passed? && user_test_passage != test_passage
      end

      false  
    end

  end

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
