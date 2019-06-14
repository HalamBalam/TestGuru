# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
math = Category.create(title: 'Math')
physics = Category.create(title: 'Physics')
chemistry = Category.create(title: 'Chemistry')

math_test = Test.create(title: 'Quadratic equation', category_id: math.id)
physics_test = Test.create(title: 'Electric current', category_id: physics.id, level: 2)
chemistry_test = Test.create(title: 'Periodic table', category_id: chemistry.id, level: 3)

math_question = Question.create(body: 'Write the formula of discriminant', test_id: math_test.id)
physics_question = Question.create(body: 'What is the name of the device for measuring voltage?', test_id: physics_test.id)
chemistry_question = Question.create(body: 'How many elements are in the Periodic table?', test_id: chemistry_test.id)

User.create(name: 'Альберт Эйнштейн')
User.create(name: 'Антон Сурганов')

Answer.create([
  { body: 'D = b**2 - 4 * a * c', correct: true, question_id: math_question.id },
  { body: 'Voltmeter', correct: true, question_id: physics_question.id },
  { body: '118', correct: true, question_id: chemistry_question.id }
  ])
