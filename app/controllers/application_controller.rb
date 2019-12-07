# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :set_locale

  def default_url_options
    { lang: I18n.locale }
  end

  protected

  def after_sign_in_path_for(resource)
    if current_user.admin?
      admin_tests_path
    else
      root_path
    end
  end

  private

  def set_locale
    target_locale = I18n.locale_available?(params[:lang]) ? params[:lang] : I18n.default_locale
    I18n.locale = target_locale unless I18n.default_locale == target_locale
  end
end
