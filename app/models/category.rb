# frozen_string_literal: true

class Category < ApplicationRecord
  has_many :tests

  default_scope { order(title: :desc) }

  validates :title, presence: true
end
