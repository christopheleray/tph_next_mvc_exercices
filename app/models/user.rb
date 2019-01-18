# frozen_string_literal: true

class User < ApplicationRecord
  after_create :send_welcome_email
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable

  private

  def send_welcome_email
    UserMailer.welcome_email(self).deliver_later
  end

  def send_offer(user)
    UserMailer.send_offer(user).deliver_later
  end
end
