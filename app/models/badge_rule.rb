# frozen_string_literal: true

class BadgeRule < ApplicationRecord
  has_many :badges, dependent: :destroy
  belongs_to :category, optional: true

  validates :level, numericality: { greater_than_or_equal_to: -1 }
  validates :attempt, numericality: { greater_than_or_equal_to: -1 }
end
