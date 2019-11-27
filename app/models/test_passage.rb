# frozen_string_literal: true

class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_first_question, on: :create
  before_validation :before_validation_set_next_question, on: :update

  PASSAGE_SUCCESS_PERCENT = 85

  def accept!(answer_ids)
    self.correct_questions += 1 if correct_answer?(answer_ids)
    save
  end

  def completed?
    current_question.nil?
  end

  def result
    {
      total_questions_count: test.questions.size,
      correct_questions_count: self.correct_questions,
      correct_questions_percent: correct_questions_percent
    }
  end

  def question_number(question)
    self.test.questions.find_index(question) + 1
  end

  def succeed?
    correct_questions_percent >= PASSAGE_SUCCESS_PERCENT
  end

  private

  def before_validation_set_next_question
    self.current_question = next_question
  end

  def before_validation_set_first_question
    self.current_question = test.questions.first if test.present?
  end

  def correct_questions_percent
    (self.correct_questions.to_f / test.questions.size) * 100
  end

  def correct_answer?(answer_ids)
    correct_answers.ids.sort == answer_ids.map(&:to_i).sort
  end

  def correct_answers
    current_question.answers.correct
  end

  def next_question
    test.questions.order(:id).where('id > ?', current_question.id).first
  end
end
