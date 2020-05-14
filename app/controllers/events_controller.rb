class EventsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @events = Event.all
  end
  
  def new
    @event = Event.new
  end
  
  def show
    @event = Event.find(params[:id])
  end
  
  def create
    @event = Event.new(event_params.merge({admin: current_user}))
    if @event.save
      flash[:notice] = 'Event successfully created'
      redirect_to event_path(@event.id)
    else
      render :new
    end
  end
  
  def event_params
    params.require(:event).permit(:title, :description, :start_date, :duration, :location, :price)
  end
end