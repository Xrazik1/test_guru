# frozen_string_literal: true

module QuestionsHelper
  def question_header(question)
    question.new_record? ? "Создать новый '#{question.test.title}' вопрос" : "Изменить '#{question.test.title}' вопрос"
  end
end
