# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'hello@coffeeshop.com'
  layout 'mailer'
end
