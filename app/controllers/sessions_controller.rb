class SessionsController < ApplicationController
  def new
  end

  def create
    self.current_user = User.find_by(username: params[:session][:username])
    @current_user = current_user
    if current_user
      redirect_to @current_user
    else
      render :new
    end
  end

  def delete
    self.current_user = nil
    redirect_to :root
  end
end
