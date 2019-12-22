# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  @feedback_email = ENV['FEEDBACK_EMAIL']

  default from: %W[TestGuru <#{@feedback_email}>]
  layout 'mailer'
end
