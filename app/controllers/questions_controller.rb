# frozen_string_literal: true

class QuestionsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_test, only: %i[index new create]
  before_action :find_question, only: %i[edit update destroy show]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def edit; end

  def new
    @question = @test.questions.new
  end

  def create
    @question = @test.questions.new(question_params)
    @question.save ? redirect_to(@test) : render(:new)
  end

  def update
    @question.update(question_params) ? redirect_to(@question.test) : render(:edit)
  end

  def destroy
    @question.destroy
    redirect_to(@question.test)
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:body)
  end

  def rescue_with_question_not_found
    render plain: 'Вопрос не найден'
  end
end
