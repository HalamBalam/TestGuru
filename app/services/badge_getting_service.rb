class BadgeGettingService

  def initialize(user, test_passage)
    @user = user
    @test_passage = test_passage
    @test = test_passage.test
  end

  def give_badges
    return if test_was_passed_earlier?

    Badge.all.each do |badge|
      rule = rule_identity(badge)
      @user.badges << badge if send("#{rule}_award?", badge)
    end
  end

  private

  def category_award?(badge)
    all_tests_passed?(badge.category.tests)
  end

  def first_attempt_award?(badge)
    TestPassage.user_passages_for_test(@user, @test).where('id != ?', @test_passage.id).empty? 
  end

  def level_award?(badge)
    all_tests_passed?(Test.where(level: badge.level))  
  end

  def test_was_passed_earlier?
    TestPassage.user_passages_for_test(@user, @test).each do |test_passage|
      return true if test_passage.test_passed? && test_passage != @test_passage
    end

    false  
  end

  def all_tests_passed?(tests)
    passed_tests = []
    TestPassage.user_passages_for_test(@user, tests).each do |test_passage|
      if test_passage.test_passed?
        passed_tests << test_passage.test  
      end
    end

    passed_tests.uniq!

    return tests.count == passed_tests.count
  end

  def rule_identity(badge)
    return "category" unless badge.category.nil?
    return "first_attempt" if badge.first_attempt
    return "level" if badge.level.to_i > 0
  end

end
