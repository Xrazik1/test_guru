# frozen_string_literal: true

class Admin::BaseController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_required!

  private

  def admin_required!
    redirect_to root_path, alert: 'У вас недостаточно прав для того чтобы видеть данную страницу' unless current_user.admin?
  end
end
