# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
math = Category.create!(title: 'Math')
physics = Category.create!(title: 'Physics')
chemistry = Category.create!(title: 'Chemistry')

admin = User.create!(email: 'admin@example.com', type: 'Admin', first_name: 'admin', last_name: 'admin', password: 'secretus')
user = User.create!(email: 'user@example.com', password: 'secretus')

math_test = math.tests.create!(title: 'Quadratic equation', author: admin)
physics_test = physics.tests.create!(title: 'Electric current', author: admin, level: 2)
chemistry_test = chemistry.tests.create!(title: 'Periodic table', author: admin, level: 3)

math_question = math_test.questions.create!(body: 'Write the formula of discriminant')
physics_question = physics_test.questions.create!(body: 'What is the name of the device for measuring voltage?')
chemistry_question = chemistry_test.questions.create!(body: 'How many elements are in the Periodic table?')

math_question.answers.create!(body: 'D = b**2 - 4 * a * c', correct: true)
physics_question.answers.create!(body: 'Voltmeter', correct: true)
chemistry_question.answers.create!(body: '118', correct: true)
