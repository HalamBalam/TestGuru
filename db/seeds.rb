# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
admin = User.create!(email: 'admin@example.com', type: 'Admin', first_name: 'admin', last_name: 'admin', password: 'secretus')
user = User.create!(email: 'user@example.com', password: 'secretus')

# Тест по физике
category = Category.create!(title: 'Физика')
test = category.tests.create!(title: 'Физика. Механическое движение', author: admin, level: 1)

question = test.questions.create!(body: 'Длина линии, которую описывает тело при своем движении в течение некоторого промежутка времени, называется...')
question.answers.create!(body: 'пройденным путем.', correct: true)
question.answers.create!(body: 'траекторией.')
question.answers.create!(body: 'механическим движением.')

question = test.questions.create!(body: 'Сидя в автобусе, пассажир отмечал время прохождения автобуса между придорожными столбами, установленными через каждый километр дороги. Оказалось, что первый километр он проехал за 70 с, второй — за 80 с и третий — за 50 с. Вычислите среднюю скорость автобуса.')
question.answers.create!(body: '5 м/с')
question.answers.create!(body: '18 м/с')
question.answers.create!(body: '7,5 м/с')
question.answers.create!(body: '15 м/с', correct: true)

question = test.questions.create!(body: 'От дома до школы расстояние 900 м. Этот путь ученик прошел за 15 мин. С какой средней скоростью шел ученик?')
question.answers.create!(body: '60 м/с')
question.answers.create!(body: '1 м/с', correct: true)
question.answers.create!(body: '15 м/с')
question.answers.create!(body: '10 м/с')

question = test.questions.create!(body: 'Что называют механическим движением?')
question.answers.create!(body: 'Линию, по которой движется тело.')
question.answers.create!(body: 'Длину траектории, по которой движется тело.')
question.answers.create!(body: 'Изменение положения тела в пространстве и во времени относительно других тел', correct: true)

question = test.questions.create!(body: 'Космические ракеты, предназначенные для полетов на другие планеты, должны иметь скорость относительно Земли 41 760 км/ч. Выразите эту скорость в м/с.')
question.answers.create!(body: '200 м/с')
question.answers.create!(body: '11 600 м/с', correct: true)
question.answers.create!(body: '15 м/с')
question.answers.create!(body: '8 900 м/с')

# Тест по химии
category = Category.create!(title: 'Химия')
test = category.tests.create!(title: 'Химия. Строение атома', author: admin, level: 2)

question = test.questions.create!(body: 'Найдите сколько протонов, нейтронов и электронов в атоме стронция')
question.answers.create!(body: '50;38;38')
question.answers.create!(body: '38;50;38', correct: true)
question.answers.create!(body: '38;38;50')

question = test.questions.create!(body: 'Что показывает заряд ядра атома?')
question.answers.create!(body: 'число нейтронов')
question.answers.create!(body: 'число электронов')
question.answers.create!(body: 'число протонов', correct: true)
question.answers.create!(body: 'сумму протонов и нейтронов')

question = test.questions.create!(body: 'Кто доказал, что в центре атома положительное ядро?')
question.answers.create!(body: 'Э. Резерфорд', correct: true)
question.answers.create!(body: 'А.Беккерель')
question.answers.create!(body: 'Д. Чедвик')
question.answers.create!(body: 'М. Кюри и П. Кюри')

question = test.questions.create!(body: 'Атомная масса равна')
question.answers.create!(body: 'сумме всех протонов и нейтронов', correct: true)
question.answers.create!(body: 'сумме всех нейтронов и электронов')
question.answers.create!(body: 'числу протонов')
question.answers.create!(body: 'сумме всех протонов и электронов')

question = test.questions.create!(body: 'ß-лучи- это поток каких частиц?')
question.answers.create!(body: 'нейтронов')
question.answers.create!(body: 'протонов')
question.answers.create!(body: 'ядер атомов')
question.answers.create!(body: 'электронов', correct: true)

# Тест по математике
category = Category.create!(title: 'Математика')
test = category.tests.create!(title: 'Математика. Логарифмы', author: admin, level: 3)

question = test.questions.create!(body: 'Решите уравнение: log2(x + 1) + log2(x - 2) = 2')
question.answers.create!(body: '3 и -2')
question.answers.create!(body: '2')
question.answers.create!(body: '2 и -3')
question.answers.create!(body: '3', correct: true)

question = test.questions.create!(body: 'Вычислите: log2(16) - log8(64)')
question.answers.create!(body: '16')
question.answers.create!(body: '-8')
question.answers.create!(body: '2', correct: true)
question.answers.create!(body: '0')

question = test.questions.create!(body: 'Решите уравнение: log2(x - 6) = 5')
question.answers.create!(body: '38', correct: true)
question.answers.create!(body: '90')
question.answers.create!(body: '0')
question.answers.create!(body: '18')

question = test.questions.create!(body: 'Решите уравнение: logx(2x - 1) = logx(4x - 3)')
question.answers.create!(body: '-1')
question.answers.create!(body: '1')
question.answers.create!(body: 'нет правильного ответа')
question.answers.create!(body: 'нет корней', correct: true)

question = test.questions.create!(body: 'Решите уравнение: log2(x + 4) - log2(x - 2) = 2')
question.answers.create!(body: '4', correct: true)
question.answers.create!(body: 'нет корней')
question.answers.create!(body: '2')
question.answers.create!(body: '3')
