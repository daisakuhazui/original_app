class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      # この後、updateが成功したらflashメッセージが出るようにする
    else
      render 'edit'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

private

    def user_params
      params.require(:user).permit(:email, :alias_name, :name, :profile_image, :cover_image, :area, :introduce )
    end
end
