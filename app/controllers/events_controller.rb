class EventsController < ApplicationController
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
  end 

  def update
    @event = Event.find_by_id(params[:id])
    redirect_to event_path(@event)
  end  

  private

  def event_params
    params.require(:event).permit(:name, :description, :place, :date, :time, :host_id)
  end  
end
