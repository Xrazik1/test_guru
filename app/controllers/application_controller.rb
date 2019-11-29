# frozen_string_literal: true

class ApplicationController < ActionController::Base

  helper_method :current_user,
                :logged_in?

  private

  def authenticate_user!
    session[:source_url] = request.path

    unless current_user
      redirect_to login_path, alert: 'Если вы гуру, то подтвердите вашу почту и пароль'
    end
  end

  def log_out!
    reset_session if logged_in?
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_in?
    current_user.present?
  end
end
