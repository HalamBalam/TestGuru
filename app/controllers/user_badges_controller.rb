class UserBadgesController < ApplicationController

  def index
    @user_badges = UserBadge.where(user: current_user)
  end

  def show
    @badge = UserBadge.find(params[:id]).badge
    redirect_to badge_path(@badge)
  end

end
