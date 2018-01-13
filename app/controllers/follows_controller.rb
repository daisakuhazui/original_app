class FollowsController < ApplicationController
  before_action :set_follow

  def create
    current_user.follow(@follow)
    redirect_to @follow
  end

  def destroy
    current_user.stop_following(@follow)
    redirect_to @follow
  end

  private

  def set_follow
    @follow = User.find(params[:followable_id])
  end
end
