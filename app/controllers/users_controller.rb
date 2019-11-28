# frozen_string_literal: true

class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.save ? redirect_to(tests_path) : render(:new)
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :name, :surname)
  end
end
