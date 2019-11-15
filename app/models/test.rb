# frozen_string_literal: true

class Test < ApplicationRecord
  has_many :questions

  has_and_belongs_to_many :users
  belongs_to :author, class_name: 'User'
  belongs_to :category

  scope :easy, -> { where(level: 0..1) }
  scope :medium, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 5..Float::INFINITY) }

  scope :by_cat_name, lambda { |cat_name|
    joins('JOIN categories ON categories.id = tests.category_id').where('categories.title = ?', cat_name)
  }

  def self.get_names_by_cat(cat_name)
    by_cat_name(cat_name).order(id: :desc).pluck(:title)
  end

  validates :title, presence: true
  validate :validate_match_level_and_title
  validates_numericality_of :level, greater_than_or_equal_to: 0

end
