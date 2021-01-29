class UsersController < ApplicationController

    def index
        @users = User.new 
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
            render :new
        end 
    end 

    def show
        # redirect_if_not_logged_in
        @user = User.find_by_id(params[:id])
        redirect to '/' if !@user
    end 

    private

    def user_params
        # take the params, require object that comes through our params and then permit any other params we want
        params.require(:user).permit(:username, :email, :password_digest)
    end 

end
