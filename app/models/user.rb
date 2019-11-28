# frozen_string_literal: true

class User < ApplicationRecord
  VALID_EMAIL_REGEXP = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/.freeze

  has_many :author_tests, class_name: 'Test', foreign_key: 'author_id'
  has_many :test_passages
  has_many :tests, through: :test_passages

  validates :email, presence: true, format: { with: VALID_EMAIL_REGEXP }
  validates_uniqueness_of :email

  has_secure_password

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end

  def tests_by_level(level)
    tests.where('level = ?', level)
  end
end
