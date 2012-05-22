class ApplicationController < ActionController::Base
  protect_from_forgery
  protected
  
  def set_current_user
    if session[:user_id] 
           @current_user = User.find(session[:user_id])
       else
           @current_user = nil
       end
  end
  
  def login_required
    if @current_user.nil?
         redirect_to root_path,:notice => "login required"    
    end
  end
end
