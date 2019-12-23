# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

frontend_cat = Category.create(title: 'Frontend')
backend_cat = Category.create(title: 'Backend')

admin = User.create(name: 'Артем', surname: 'Петров', email: 'kolja-savelev@mail.ru',
            password: '123456', privilege: 'admin')

test1 = Test.create(title: 'Ruby', level: 1, category_id: backend_cat.id, author_id: admin.id)
test2 = Test.create(title: 'Python', level: 0, category_id: backend_cat.id, author_id: admin.id)
test3 = Test.create(title: 'HTML', level: 0, category_id: frontend_cat.id, author_id: admin.id)
test4 = Test.create(title: 'CSS', level: 2, category_id: frontend_cat.id, author_id: admin.id)
test5 = Test.create(title: 'Go', level: 0, category_id: backend_cat.id, author_id: admin.id)
test6 = Test.create(title: 'C#', level: 2, category_id: backend_cat.id, author_id: admin.id)

question1 = Question.create(body: 'Аббревиатура HTML', test_id: test3.id)
question2 = Question.create(body: 'Для чего изначально создавался HTML?', test_id: test3.id)
question3 = Question.create(body: 'Как объявить переменную в Ruby?', test_id: test1.id)
question4 = Question.create(body: 'Какая начальная позиция элемента в массиве?', test_id: test1.id)
question5 = Question.create(body: 'Существует ли возможность создавать классы в Go?', test_id: test5.id)
question6 = Question.create(body: 'Какой стандартный пакет используется для операций ввода-вывода в Go?', test_id: test5.id)

Answer.create(body: 'system', question_id: question6.id, correct: false)
Answer.create(body: 'console', question_id: question6.id, correct: false)
Answer.create(body: 'io', question_id: question6.id, correct: false)
Answer.create(body: 'fmt', question_id: question6.id, correct: true)

Answer.create(body: 'Нет', question_id: question5.id, correct: true)
Answer.create(body: 'Да', question_id: question5.id, correct: false)

Answer.create(body: 'В Ruby нет массивов', question_id: question4.id, correct: false)
Answer.create(body: '0', question_id: question4.id, correct: true)
Answer.create(body: '-1', question_id: question4.id, correct: false)
Answer.create(body: '1', question_id: question4.id, correct: false)

Answer.create(body: 'var number int = 1', question_id: question3.id, correct: false)
Answer.create(body: 'let number = 1', question_id: question3.id, correct: false)
Answer.create(body: 'number = 1', question_id: question3.id, correct: true)
Answer.create(body: 'var number = 1', question_id: question3.id, correct: false)

Answer.create(body: 'Для разметки таблиц в Excel', question_id: question2.id, correct: false)
Answer.create(body: 'Для позиционирования элементов на веб-странице', question_id: question2.id, correct: true)
Answer.create(body: 'Для создания стилей на веб-странице', question_id: question2.id, correct: false)
Answer.create(body: 'Для создания игры в браузере', question_id: question2.id, correct: false)

Answer.create(body: 'HyperText Markup Language', question_id: question1.id, correct: true)
Answer.create(body: 'HyperTransfer Markup Language', question_id: question1.id, correct: false)
Answer.create(body: 'HyperTransport Markup Language', question_id: question1.id, correct: false)
Answer.create(body: 'HyperText Manage Language', question_id: question1.id, correct: false)
