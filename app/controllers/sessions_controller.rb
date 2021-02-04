class SessionsController < ApplicationController

    def welcome
    end 

    def omniauth
        user = User.from_omniauth(request.env['omniauth.auth'])
        if user.valid?
            session[:user_id] = user.id
            redirect_to user_path(user)
        else  
            redirect_to '/login'
        end 
    end 

    def create
        @user = User.find_by(username: params[:user][:username])
        if @user && @user.authenticate(params[:user][:password])

            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else 
            @error = "please be sure to fill in both fields"
            render :new 
        end 

    end 

    def destroy
        session.delete(:user_id)
        redirect_to '/'
    end

end 