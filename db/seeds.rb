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

author = User.create(name: 'Иван', surname: 'Иванов', email: 'ivan@mail.ru',
                     password: '12345', privilege: 'author')

test1 = Test.create(title: 'Ruby', level: 1, category_id: backend_cat.id, author_id: author.id)
test2 = Test.create(title: 'Python', level: 0, category_id: backend_cat.id, author_id: author.id)
test3 = Test.create(title: 'HTML', level: 0, category_id: frontend_cat.id, author_id: author.id)
test4 = Test.create(title: 'CSS', level: 2, category_id: frontend_cat.id, author_id: author.id)
test5 = Test.create(title: 'Go', level: 0, category_id: backend_cat.id, author_id: author.id)
test6 = Test.create(title: 'C#', level: 2, category_id: backend_cat.id, author_id: author.id)

question1 = Question.create(body: 'Аббревиатура HTML', test_id: test3.id)

answer1 = Answer.create(body: 'HyperText Markup Language', question_id: question1.id, correct: true)
answer2 = Answer.create(body: 'HyperTransfer Markup Language', question_id: question1.id, correct: false)
answer3 = Answer.create(body: 'HyperTransport Markup Language', question_id: question1.id, correct: false)
answer4 = Answer.create(body: 'HyperText Manage Language', question_id: question1.id, correct: false)
