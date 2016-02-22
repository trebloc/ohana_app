class EventsController < ApplicationController
  before_action :logged_in?, only: [:new, :create, :edit, :update, :destroy]
  before_action :current_user?, only: [:edit, :destroy]

  def index
    @events = Event.all
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
      flash[:error] = @event.errors.full_messages.join(", ")
      redirect_to new_event_path
    end
  end

  def show
    @event = Event.find_by_id(params[:id])
  end

  def edit
    @event = Event.find_by_id(params[:id])
    # if current_user.id == session[:user_id]
    render :edit
  end

  def update
    @event = Event.find_by_id(params[:id])
    # if current_user == @event.user
      if @event.update_attributes(event_params)
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
    params.require(:event).permit(:name, :description, :place, :date, :host_id)
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
