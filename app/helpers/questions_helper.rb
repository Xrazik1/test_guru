# frozen_string_literal: true

module QuestionsHelper
  def question_header(entity, mode)
    header = "Создать новый '#{entity.title}' вопрос" if mode == 'new'
    header = "Изменить '#{entity.title}' вопрос" if mode == 'edit'
    header
  end
end
