# frozen_string_literal: true

class SessionsController < ApplicationController
  def new
    
  end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to tests_path
    else
      flash.now[:alert] = 'Если вы гуру, то подтвердите вашу почту и пароль'
      render(:new)
    end
  end
end
