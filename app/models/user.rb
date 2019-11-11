# frozen_string_literal: true

class User < ApplicationRecord
  def tests(level)
    ids = test_ids.split(',').map(&:to_i)
    Test.where('id IN (?) AND level = ?', ids, level)
  end
end
