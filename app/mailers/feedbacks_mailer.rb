class FeedbacksMailer < ApplicationMailer
  def feedback_message(feedback)
    @email = feedback.user.email
    @message = feedback.message

    mail to: ENV['FEEDBACK_EMAIL'], subject: "Сообщение от #{@email}"
  end
end

