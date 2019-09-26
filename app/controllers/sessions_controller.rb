class SessionsController < ApplicationController
  def new
  end

  def create
    if (self.current_user = User.find_by(username: params[:session][:username]))
      flash[:success] = 'You are succesffully loged in.'
      redirect_to current_user
    else
      flash.now[:failure] = 'Invalid username. Please try again.'
      render :new
    end
  end

  def delete
    self.current_user = nil
    redirect_to :root
  end
end
