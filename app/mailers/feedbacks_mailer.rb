class FeedbacksMailer < ApplicationMailer
  def feedback_message(feedback)
    @email = feedback.user.email
    @message = feedback.message
    mail to: @app_email, subject: "Сообщение от #{@email}"
  end
end

