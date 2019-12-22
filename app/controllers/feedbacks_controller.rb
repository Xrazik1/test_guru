# frozen_string_literal: true

class FeedbacksController < ApplicationController
  before_action :authenticate_user!

  def new
    @feedback = Feedback.new
  end

  def create
    @feedback = current_user.feedbacks.new(feedback_params)

    if @feedback.save
      FeedbacksMailer.feedback_message(@feedback).deliver
      redirect_to tests_path, notice: 'Сообщение успешно отправлено'
    else
      render :new
    end
  end

  private

  def feedback_params
    params.require(:feedback).permit(:message)
  end
end
