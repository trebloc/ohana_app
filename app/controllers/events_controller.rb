class EventsController < ApplicationController
  before_action :logged_in?, only: [:new, :create, :edit, :update, :destroy]

  def index
    @events = Event.all
    render :index
  end

  def new
    @event = Event.new
  end  

  def create  
    @event = Event.create(event_params)
    redirect_to event_path(@event)
  end

  def show
    @event = Event.find_by_id(params[:id])
  end

  def edit
    @event = Event.find_by_id(params[:id])
    unless current_user == @event.user
      redirect_to user_path(current_user)    
    end 
  end  

  def update
    @event = Event.find_by_id(params[:id])
    if current_user == @event.user
      if @event.update_attributes(event_params)
        flash[:notice] = "Successfully updated event."
        redirect_to event_path(@event)
      else
        flash[:error] = @event.errors.full_messages.join(", ")
        redirect_to edit_event_path(@event)
      end
    else
      redirect_to user_path(current_user)
    end
  end  

  def destroy
    @event = Event.find_by_id(params[:id])
    if current_user == @event.user
      @event.destroy
      flash[:notice] = "Successfully deleted event."
    end
    redirect_to events_path(current_user)
  end

  private

  def event_params
    params.require(:event).permit(:name, :description, :place, :date, :host_id)
  end  
end
