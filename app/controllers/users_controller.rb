# frozen_string_literal: true

class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      self.current_user = @user
      redirect_to @user
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
    @created_upcoming = @user.events.upcoming
    @created_previous = @user.events.previous
    @attended_upcoming = @user.attended_events.upcoming
    @attended_previous = @user.attended_events.previous
  end

  private

  def user_params
    params.require(:user).permit(:username)
  end
end
