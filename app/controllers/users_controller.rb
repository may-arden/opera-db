class UsersController < ApplicationController
    include UsersHelper

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
        redirect_if_not_logged_in
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

end
