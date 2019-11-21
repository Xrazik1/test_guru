# frozen_string_literal: true

class QuestionsController < ApplicationController
  before_action :find_test, only: %i[index show create]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    redirect_to @test
  end

  def edit
    @question = Question.find(params[:id])
  end

  def new
    @question = @test.questions.new
  end

  def create
    question = @test.questions.new(question_params)
    result = question.save ? question : question.errors.messages

    render plain: result.inspect
  end

  def update
    @question = Question.find(params[:id])
    @question.update(question_params) ? redirect_to(@test) : render(:edit)
  end

  def destroy
    question = Question.find(params[:id])
    question.destroy
    redirect_to(question.test)
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
