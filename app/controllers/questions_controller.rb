# frozen_string_literal: true

class QuestionsController < ApplicationController
  before_action :find_test

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
end
