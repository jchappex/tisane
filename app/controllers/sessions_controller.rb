class SessionsController < ApplicationController
  skip_before_action :authorize
  skip_before_action :admin_only
  
  def index
    @users = User.order(:name)
  end

  def new
  end

  def create
    user = User.find_by(name: params[:name])
    if user and user.authenticate(params[:password])
      session[:user_id] = user.id
      if current_user.admin == false
        redirect_to store_url
      end
      if current_user.admin == true
        redirect_to admin_url
      end
    else
      redirect_to login_url, alert: "Invalid user/password combination"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to store_url, notice: "Logged out"
  end
end
