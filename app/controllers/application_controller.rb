class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authorize

  protected
  
  def authorize
    respond_to do |format|
      format.html do
        unless User.count.zero? or User.find_by(id: session[:user_id])
          redirect_to login_url, notice: "Please log in" 
        end
      end
      
      format.any do
        authenticate_or_request_with_http_basic do |username, password|
          user = User.find_by_name(username)
          user and user.authenticate(password)
        end
      end
    end
  end
end
