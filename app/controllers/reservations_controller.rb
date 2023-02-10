class ReservationsController < ApplicationController
    before_action :authenticate_user
    def index
        @user=current_user
        @reservations=Reservation.where(user_id: current_user).includes(:user).order("created_at DESC")
    end
    
    def new
        @reservation =Reservation.new(**reservation_params,user_id: current_user.id)
        @room=Room.find(params[:reservation][:room_id])
        
         if @reservation.invalid?
            render "rooms/show"
         else
            @reservation.total_day=(@reservation.end_date - @reservation.start_date).to_i
         end
    end

    def create
        @reservation = Reservation.new(**reservation_params,user_id: current_user.id)
        @room=Room.find(params[:reservation][:room_id])
        if @reservation.save!
            flash[:notice]="予約完了"
            redirect_to reservations_path
        else
            flash[:alert]="予約できませんでした"
            redirect_to reservations_path
        end
    end

    def destroy
        @reservation = Reservation.find(params[:id])
        @reservation.destroy
        flash[:notice] = "削除しました"
        redirect_to reservation_path
     end




    private

    def reservation_params
        params.require(:reservation).permit(:start_date, :end_date, :people, :room_id, :user_id, :total_price, :total_day, :title, :img, :about)
    end
end