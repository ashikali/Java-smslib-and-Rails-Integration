# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base

  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  
  before_filter :authorize , :except => :login

#  def set_timezone
    # current_user.time_zone #=> 'London'
#    Time.zone = 'Chennai'
#  end
   
  layout proc{ |c| c.request.xhr? ? false : "standard" }

  # Scrub sensitive parameters from your log
   def redirect_to_index( msg = nil )
      session[ :notice ] = msg if msg
      redirect_to( :action => 'index' )
   end

   filter_parameter_logging :password

  def authorize
    unless User.find_by_id( session[ :user_id ] )  
      session[:warning] = "Please Log in" 
      redirect_to( :controller => "login" , :action => "login" ) 
    end
  end

  

end
