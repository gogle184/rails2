class RoomsController < ApplicationController
  before_action :set_q, only:[:index, :search]
  before_action :authenticate_user,{only:[:create,:edit,:update]}
  def index
    @rooms=Room.where(user_id: current_user).includes(:user).order("created_at DESC")
    @user=current_user
  end

  def new
    @room=Room.new
  end

  def create
    @room=Room.new(**room_params,user_id: current_user.id)
    if @room.save
      flash[:notice]="情報を登録しました"
      redirect_to :rooms
    else
      render "new"
    end
  end

  def show
    @user=current_user
    @room=Room.find(params[:id])
    @reservation = Reservation.new
  end

  def edit
    @room=Room.find(params[:id])
  end

  def update
    @room=Room.find(params[:id])
    if @room.update(room_params)
      flash[:notice]="情報を編集しました"
      redirect_to :rooms
    else
      render "edit"
    end
  end

  def destroy
    @room=Room.find(params[:id])
    @room.destroy
    redirect_to :rooms
  end

  def search
    @results =@q.result
    @user=current_user
  end



  private

  def set_q
    @q=Room.ransack(params[:q])

  end
  def room_params
    params.require(:room).permit(:title,:about,:price,:adress,:img)
  end
end
