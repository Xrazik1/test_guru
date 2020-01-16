# frozen_string_literal: true

class Admin::BadgesController < Admin::BaseController
  before_action :find_badge, only: %i[show destroy]

  def index
    @badges = Badge.all
  end

  def show; end

  def new
    @badge = Badge.new
  end

  def create
    @badge = Badge.new(badge_params)
    @badge.save ? redirect_to(admin_badges_url) : render(:new)
  end

  def destroy
    @badge.destroy
    redirect_to(admin_badges_url)
  end

  private

  def find_badge
    @badge = Badge.find(params[:id])
  end

  def badge_params
    params.require(:badge).permit(:title, :icon_url, :badge_rule_id)
  end
end

