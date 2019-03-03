# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'guy@h21.uk'
  layout 'mailer'
end
