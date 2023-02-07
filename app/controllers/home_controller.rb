class HomeController < ApplicationController
  before_action :set_q, only:[:index, :search]
  def index
    @users=User.all
    @rooms=Room.all
    @q=Room.ransack(params[:q])
    @results=@q.result
  end

  def search
    @results =@q.result
    @user=current_user
  end

  private

  def set_q
    @q=Room.ransack(params[:q])

  end
end
