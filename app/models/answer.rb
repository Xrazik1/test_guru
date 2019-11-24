# frozen_string_literal: true

class Answer < ApplicationRecord
  ANSWERS_MAX_COUNT = 4

  belongs_to :question

  scope :correct, -> { where(correct: true) }

  validates :body, presence: true
  validate :validate_answers_count, on: :create

  private

  def validate_answers_count
    answers_count = question.nil? ? 0 : question.answers.count
    errors.add :message, "'Вопрос достиг максимального числа ответов'" if answers_count >= ANSWERS_MAX_COUNT
  end
end
