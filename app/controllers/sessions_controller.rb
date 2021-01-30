class SessionsController < ApplicationController

    def welcome
    end 

    def create
        @user = User.find_by(username: params[:user][:username])

        # if user && user.authenticate(password: params[:user][:password])

            session[:user_id] = @user.id
            redirect_to user_path(@user)
        # else 
        #     redirect_to login_path
        # end 

    end 

    def destroy
        # should this be username or user_id?
        session.delete(:user_id)
        redirect_to '/'
    end

end 