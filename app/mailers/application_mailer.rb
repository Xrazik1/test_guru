# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  @app_email = Rails.application.config.action_mailer.smtp_options[:user_name] + 'gmail.com'

  default from: %W[TestGuru <#{@app_email}>]
  layout 'mailer'
end
