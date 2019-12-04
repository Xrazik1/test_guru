# frozen_string_literal: true

class AnswersController < ApplicationController
  before_action :authenticate_user!
  before_action :find_answer, only: %i[show]

  private

  def find_answer
    @answer = Answer.find(params[:id])
  end
end
