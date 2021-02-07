class ApplicationController < ActionController::Base
    include ApplicationHelper 
    helper_method :current_user, :logged_in?

    def logged_in?
        !!session[:user_id]
    end

    def current_user
        @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
    end

    def redirect_if_not_logged_in
        redirect_to '/' and return if !logged_in?
    end 

    # def redirect_if_not_authorized ## not currently using this method 
    #     if @user != current_user
    #         redirect_to '/' and return if !logged_in?
    #     end 
    # end 

end
