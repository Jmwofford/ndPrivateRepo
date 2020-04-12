class SessionsController < ApplicationController
  def index
    current_user
  end 
  def create
    user = User.find_by(email:login_params[:email])
    if user && user.authenticate(login_params[:password])
      session[:user_id] = session.id
      redirect_to '/dashboard'
    else
      flash[:login_errors] = ['invalid credentials']
      redirect_to '/'
    end
  end

  private
    def login_params
    params.require(:login).permit(:email,:password)
    end
end
