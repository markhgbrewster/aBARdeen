class ApplicationController < ActionController::Base
  protect_from_forgery
  include TwitterHelper
  
  require 'nokogiri'
  require 'open-uri'
  
    #creates a session for admin or user
    def find_user_name
     if admin_signed_in? 
        return admin.current_admin
	admin_session
     elsif user_signed_in?
        return user.current_user
	user_session
     end
    end
  
  
    #Checks whether a user is signed in as a user or administrator
    def authenticate_user_or_admin!
      unless user_signed_in? or admin_signed_in?
	redirect_to root_path, :alert => "Access Denied"
      end
    end
    
end
