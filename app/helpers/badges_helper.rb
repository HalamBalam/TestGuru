module BadgesHelper

  def default_image
    'badge.jpg'
  end

  def rule_info(badge)
    return "Успешное прохождение всех тестов категории #{badge.category.title}" unless badge.category.nil?
    return "Успешное прохождения теста с первой попытки" if badge.first_attempt
    return "Успешное прохождение всех тестов с уровнем #{badge.level}" if badge.level.to_i > 0
  end

end
