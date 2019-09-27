# frozen_string_literal: true

class AttendancesController < ApplicationController
  def create
    if current_user.attendances.new(event_id: params[:event_id], invited_by: current_user).save
      flash[:success] = 'You are now attending to the event!'
      redirect_to event_path(params[:event_id])
    else
      flash[:failure] = 'Something went wrong! :('
      redirect_to :root
    end
  end
end
