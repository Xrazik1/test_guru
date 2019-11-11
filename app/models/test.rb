# frozen_string_literal: true

class Test < ApplicationRecord
  has_and_belongs_to_many :users

  def self.get_names_by_cat(cat_name)
    category = Category.where(title: cat_name)
    where(category_id: category.first.id).order(id: :desc).pluck(:title)
  end
end
