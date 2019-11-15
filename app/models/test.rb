# frozen_string_literal: true

class Test < ApplicationRecord
  has_many :questions

  has_and_belongs_to_many :users
  belongs_to :author, class_name: 'User'
  belongs_to :category

  scope :easy, -> { where(level: 0..1) }
  scope :medium, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 4..Float::INFINITY) }

  scope :get_names_by_cat, lambda { |cat_name|
    joins('JOIN categories ON categories.id = tests.category_id')
      .where('categories.title = ?', cat_name)
      .order(id: :desc)
      .pluck(:title)
  }

end
