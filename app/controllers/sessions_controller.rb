class SessionsController < ApplicationController
  skip_before_action :authorize
  
  def new
  end

  def create
    if User.count.zero?
      user = User.new(name: params[:name], password: params[:password])

      unless user.save
        redirect_to login_url, alert: 'Incorrect user or password for user'
      end
    end

    user = User.find_by(name: params[:name])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to admin_url
    else
      redirect_to login_url, alert: "Invalid user/password combination"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to store_index_url, notice: "Logged out"
  end
end
