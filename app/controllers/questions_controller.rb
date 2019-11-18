# frozen_string_literal: true

class QuestionsController < ApplicationController
  before_action :find_test, only: %i[index show]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    @test
  end

  def show
    @question = @test.questions.find(params[:id])
  end

  def new; end

  def create
    question = Question.create!(question_params.merge(test_id: params[:test_id]))
    render plain: question.inspect
  end

  def destroy
    Question.destroy(params[:id])
    render plain: "Вопрос id:#{params[:id]} успешно удалён"
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def question_params
    params.require(:question).permit(:body)
  end

  def rescue_with_question_not_found
    render plain: 'Вопрос не найден'
  end
end
