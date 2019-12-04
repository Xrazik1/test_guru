# frozen_string_literal: true

class ApplicationController < ActionController::Base

  protected

  def after_sign_in_path_for(resource)
    if current_user.privilege == 'admin'
      admin_tests_path
    else
      root_path
    end
  end
end
