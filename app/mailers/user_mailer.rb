# frozen_string_literal: true

class UserMailer < ApplicationMailer
  def send_offer(user)
    @user = user
    mail(to: @user.email, subject: 'Send offer list')
  end

  def welcome_email(user)
    @user = user
    mail(to: @user.email, subject: "Welcome #{@user.first_name}")
  end
end
