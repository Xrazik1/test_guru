# frozen_string_literal: true

class Admin::BaseController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_required!

  private

  def admin_required!
    unless current_user.privilege == 'admin'
      redirect_to root_path, alert: 'Вы не авторизованы для того чтобы видеть данную страницу'
    end
  end
end
