# frozen_string_literal: true

class EventsController < ApplicationController
  def index
    @events = Event.includes(:creator).all
    @upcoming = @events.upcoming
    @previous = @events.previous
  end

  def new
    @event = Event.new
  end

  def create
    if current_user.events.build(event_params).save
      flash[:success] = 'New event created successfully'
      redirect_to current_user
    else
      flash.now[:error] = "Couldn't create the event. Sorry!"
      render :new
    end
  end

  def show
    @event = Event.includes(:attendees).find(params[:id])
  end

  private

  def event_params
    params.require(:event).permit(:description, :date)
  end
end
