class UsersController < ApplicationController
  before_action :set_user

  def show
  end

  def update
    if @user.update_attributes(user_params)
      # この後、updateが成功したらflashメッセージが出るようにする
    else
      render 'edit'
    end
  end

  def edit
  end

private

    def user_params
      params.require(:user).permit(:email, :alias_name, :name, :profile_image, :cover_image, :area, :introduce )
    end

    def set_user
      @user = User.find(params[:id])
    end
end
