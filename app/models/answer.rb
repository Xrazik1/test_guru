# frozen_string_literal: true

class Answer < ApplicationRecord
  belongs_to :question

  scope :correct, ->(question_id) { where(correct: 'true', question_id: question_id) }
end
