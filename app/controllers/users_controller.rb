class UsersController < ApplicationController
  before_action :authenticate_user,{only:[edit,:update]}
  def show
    @user = current_user
  end

  def edit
    @user = User.find(params[:id])
    unless @user ==current_user
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update!(user_params)
      flash[:notice]="プロフィールを更新しました"
      redirect_to users_show_path
    else
      flash.now[:alert]="更新できませんでした"
      render :edit
    end
    
  end
  
  private

  def user_params
    params.require(:user).permit(:name, :profile, :image)
  end
end
