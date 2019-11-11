# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Category.create(title: 'Frontend')
Category.create(title: 'Backend')

Test.create(title: 'Ruby', level: 1, category_id: 2)
Test.create(title: 'Python', level: 0, category_id: 2)
Test.create(title: 'HTML', level: 0, category_id: 1)
Test.create(title: 'CSS', level: 2, category_id: 1)
Test.create(title: 'Go', level: 0, category_id: 2)
Test.create(title: 'C#', level: 2, category_id: 2)

User.create(name: 'Иван', surname: 'Иванов', email: 'ivan@mail.ru',
            password: '12345', privilege: 'user')
