# frozen_string_literal: true

class Feedback < ApplicationRecord
  has_one :user

  validates :message, presence: true
end
