# frozen_string_literal: true

class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def send_offer
    user = User.find(params[:id])
    UserMailer.send_offer(user).deliver_later
    redirect_to root_path
  end
end
