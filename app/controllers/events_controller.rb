class EventsController < ApplicationController
  def new
    @event = Event.new
  end

  def create
    @event = current_user.events.new(event_params)
    if @event.save
      flash[:success] = "New event created successfully"
      redirect_to current_user
    else
      flash.now[:error] = "Couldn't create the event. Sorry!"
      render :new
    end
  end

  private

  def event_params
    params.require(:event).permit(:description, :date)
  end

end
