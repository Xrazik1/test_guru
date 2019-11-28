# frozen_string_literal: true

class SessionsController < ApplicationController
  def new
    
  end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      redirect_url = session[:source_url] || tests_url
      session[:user_id] = user.id

      redirect_to redirect_url
    else
      alert('Если вы гуру, то подтвердите вашу почту и пароль')
      render(:new)
    end
  end
end
