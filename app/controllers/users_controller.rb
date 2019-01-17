# frozen_string_literal: true

class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def send_offer
    user = User.find(params[:id])
    User.send_offer(user)
    # if 
    # alert[:info] = "Email sent successfuly"
    redirect_to root_path
    # else
    # alert[:danger] = "Error - Cant' send the email"
    # end
  end
end
