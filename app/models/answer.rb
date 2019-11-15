# frozen_string_literal: true

class Answer < ApplicationRecord
  ANSWERS_MAX_COUNT = 4

  belongs_to :question

  scope :correct, ->(question_id) { where(correct: 'true', question_id: question_id) }

  validates :body, presence: true
  validate :validate_answers_count, on: :create

  private

  def validate_answers_count
    if self.class.select(:id).where(question_id: question_id).count >= ANSWERS_MAX_COUNT
      errors.add :answer, 'Вопрос достиг максимального числа ответов'
    end
  end
end
