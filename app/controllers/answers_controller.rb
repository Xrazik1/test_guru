# frozen_string_literal: true

class AnswersController < ApplicationController
  before_action :authenticate_user!
  before_action :find_answer, only: %i[show edit update destroy]
  before_action :find_question, only: %i[new create]

  def new
    @answer = @question.answers.new
  end

  def edit; end

  def create
    @answer = @question.answers.new(answer_params)
    @answer.save ? redirect_to(@answer) : render(:new)
  end

  def update
    @answer.update(answer_params) ? redirect_to(@answer) : render(:edit)
  end

  def destroy
    @answer.destroy
    redirect_to(@answer.question)
  end

  private

  def find_question
    @question = Question.find(params[:question_id])
  end

  def find_answer
    @answer = Answer.find(params[:id])
  end

  def answer_params
    params.require(:answer).permit(:body, :correct)
  end
end
