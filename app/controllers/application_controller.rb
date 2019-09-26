# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :current_user

  def current_user
    return nil unless session[:user_id]

    @current_user ||= User.find_by(id: session[:user_id])
  end

  def current_user=(user)
    if user
      session[:user_id] = user.id
    else
      session.delete :user_id
    end
    @current_user = user || nil
  end
end
