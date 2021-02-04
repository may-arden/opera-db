class UsersController < ApplicationController

    def index
        @user = User.find_by_id(params[:id])
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
            render :new
        end 
    end 

    def show
        @user = User.find_by_id(params[:id]) 
    end 


    def destroy
        if @user != current_user
            redirect_to user_path
        else 
            @user = User.find(params[:id])
            @user.destroy
            session.delete(:user_id)
            redirect_to '/'
        end 
    end 
 

    private

    def user_params
        # take the params, require object that comes through our params and then permit any other params we want
        params.require(:user).permit(:username, :password)
    end 

end
