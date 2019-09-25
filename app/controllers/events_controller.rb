class EventsController < ApplicationController

  def index
    @events = Event.includes(:user).all
  end

  def new
    @event = Event.new
  end

  def create
    if current_user.events.create(event_params)
      flash[:success] = "New event created successfully"
      redirect_to current_user
    else
      flash.now[:error] = "Couldn't create the event. Sorry!"
      render :new
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  private

  def event_params
    params.require(:event).permit(:description, :date)
  end

end
