# frozen_string_literal: true

class User < ApplicationRecord
  has_many :tests
  has_and_belongs_to_many :tests

  def tests_by_level(level)
    tests.where('level = ?', level)
  end
end
