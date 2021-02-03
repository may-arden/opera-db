class UsersController < ApplicationController

    def index
        @user = User.find_by_id(params[:id])
        # redirect_to user_path(@user.id)
        redirect_to '/'
    end

    def new
        @user = User.new 
    end 

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else 
            redirect_to signup_path
        end 
    end 

    def show
        redirect_if_not_logged_in
        @user = User.find_by_id(params[:id])
        # this will avoid error page if they're not logged in 
        redirect to '/' if !@user
    end 

    def destroy
        @user = User.find(params[:id])
        @user.destroy
        session.delete(:user_id)
        redirect_to '/'
    end 
 

    private

    def user_params
        # take the params, require object that comes through our params and then permit any other params we want
        params.require(:user).permit(:username, :password)
    end 

end
