# frozen_string_literal: true

class QuestionsController < ApplicationController
  before_action :find_test, only: %i[index new create show edit update]

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
    @question = @test.questions.new(question_params)
    @question.save ? redirect_to(@test) : render(:new)
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
    test_id = params[:test_id] || Question.find(params[:id]).test.id
    @test = Test.find(test_id)
  end

  def question_params
    params.require(:question).permit(:body)
  end

  def rescue_with_question_not_found
    render plain: 'Вопрос не найден'
  end
end
