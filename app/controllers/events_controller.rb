class EventsController < ApplicationController
  before_action :logged_in?, only: [:new, :create, :edit, :update, :destroy]
  before_action :current_user?, only: [:edit, :destroy]

  def index
    @events = Event.order(:date)
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      flash[:notice] = "Successfully created event."
      redirect_to event_path(@event)
    else
      flash[:error] = "Cannot create event."
      redirect_to new_event_path
    end
  end

  def show
    @event = Event.find_by_id(params[:id])
    @new_reservation = Reservation.new
    @reservation = @event.reservations
  end

  def edit
    @event = Event.find_by_id(params[:id])
    # if current_user.id == session[:user_id]
    render :edit
  end

  def update
    @event = Event.find_by_id(params[:id])
    # if current_user == @event.user
      p ">>>>>>>> event_params date is: #{event_params[:date]}"
      if @event.update(event_params)
        p ">>>>>>>> @event.date is: #{@event.date}"
        flash[:notice] = "Successfully updated event."
        redirect_to event_path(@event)
      else
        flash[:error] = @event.errors.full_messages.join(", ")
        redirect_to edit_event_path(@event)
      end
    # else
      # redirect_to user_path(current_user)
    # end
  end

  def destroy
    @event = Event.find_by_id(params[:id])
      @event.destroy
      flash[:notice] = "Successfully deleted event."
      redirect_to events_path(current_user)
  end

  private

  def event_params
    valid = params.require(:event).permit(:name, :description, :place, :date, :host_id)
  
    date_format = "%m/%d/%Y %I:%M %p"
    # offset = DateTime.now.strftime
    valid[:date] = valid[:date] != "" ? DateTime.strptime(valid[:date], date_format).to_s : valid[:date]
    return valid
  end     

  def current_user?
    if Event.find(params[:id]).host_id == current_user.id
      return true
    else
      redirect_to events_path
      # render file: 'public/401.html', status: 401, layout: false 
    end  
  end
end
