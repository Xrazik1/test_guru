# frozen_string_literal: true

class User < ApplicationRecord
  has_and_belongs_to_many :tests

  def tests_by_level(level)
    ids = test_ids.split(',').map(&:to_i)
    Test.where('id IN (?) AND level = ?', ids, level)
  end
end
