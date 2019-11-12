# frozen_string_literal: true

class Test < ApplicationRecord
  has_and_belongs_to_many :users
  has_many :questions
  belongs_to :category

  def self.get_names_by_cat(cat_name)
    joins('JOIN categories ON categories.id = tests.category_id')
      .where('categories.title = ?', cat_name)
      .order(id: :desc)
      .pluck(:title)
  end
end
