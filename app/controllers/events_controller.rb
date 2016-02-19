class EventsController < ApplicationController
  def index
    @events = Event.all
    render :index
  end

  def edit
  end

  def show
  end
end
