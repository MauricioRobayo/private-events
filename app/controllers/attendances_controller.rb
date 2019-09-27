# frozen_string_literal: true

class AttendancesController < ApplicationController
  def create
    if current_user.attended_events << Event.find(params[:event_id])
      flash[:success] = 'You are now attending to the event!'
      redirect_to event_path(params[:event_id])
    else
      flash[:failure] = 'Something went wrong! :('
      redirect_to :root
    end
  end
end
