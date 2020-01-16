# frozen_string_literal: true

class Badge < ApplicationRecord
  has_and_belongs_to_many :users
  belongs_to :badge_rule

  validates :title, presence: true
  validates :icon_url, presence: true
  validates :badge_rule_id, presence: true
end

