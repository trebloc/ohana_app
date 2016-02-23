class ReservationsController < ApplicationController

  def index
    @reservations = Reservation.all
  end

  def new
    @reservation = Reservation.new
  end

  def create
    @reservation = Reservation.new(reservation_params)
    if @reservation.save
      flash[:notice] = "Successfully created item."
      redirect_to events_path
    else
      flash[:error] = @event.errors.full_messages.join(", ")
      redirect_to event_path
    end
  end
  
  def show
    @reservation = Reservation.find_by_id(params[:id])      
  end
  
  private

  def reservation_params
    params.require(:reservation).permit(:item_name, :item_description, :item_image_url)
  end
end
