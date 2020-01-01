# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: %W[TestGuru <#{ENV['FEEDBACK_EMAIL']}>]
  layout 'mailer'
end
