# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :confirmable,
         :trackable,
         :validatable

  VALID_EMAIL_REGEXP = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/.freeze

  has_many :author_tests, class_name: 'Test', foreign_key: 'author_id'
  has_many :test_passages
  has_many :tests, through: :test_passages
  has_many :gists
  has_many :feedbacks
  has_and_belongs_to_many :badges

  validates :email, presence: true, format: { with: VALID_EMAIL_REGEXP }, uniqueness: { scope: :email }
  validates :name, presence: true

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end

  def tests_by_level(level)
    tests.where('level = ?', level)
  end

  def successfully_tests
    # Как можно такое в один запрос сделать?
    Test.where('tests.id IN (?)', test_passages.where(test_passages: { successfully_passed: true }).map(&:test).select(&:id))
  end

  def admin?
    privilege == 'admin'
  end
end
