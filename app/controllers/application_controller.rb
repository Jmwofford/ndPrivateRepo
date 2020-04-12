class ApplicationController < ActionController::Base
  
  protect_from_forgery with: :null_session
  skip_before_action :verify_authenticity_token

  def current_user
    if session[:user_id]
      @current_user ||=User.find(session[:user_id])
    else
      @current_user = null_session
    end
  end
end