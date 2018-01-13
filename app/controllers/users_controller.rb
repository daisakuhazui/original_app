class UsersController < ApplicationController
  before_action :set_user

  def show
    @follow_user = current_user.follows.build(followable_id: @user.id, follower_id: :current_user)
    @unfollow_user = current_user.follows.find_by(followable_id: @user.id)
  end

  def edit
  end

  def update
    if @user.update_attributes(user_params)
      redirect_to({ action: "edit" }, notice: "Profile update succeeded !")
    else
      flash.now[:error] = "Profile update failed "
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(
      :email,
      :alias_name,
      :name,
      :profile_image,
      :cover_image,
      :area,
      :introduce
    )
  end

  def set_user
    @user = User.find(params[:id])
  end
end
