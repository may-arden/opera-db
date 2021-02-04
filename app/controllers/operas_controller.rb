class OperasController < ApplicationController
    # before_action :redirect_if_not_logged_in, :redirect_if_not_authorized
   
    def index
        @operas = Opera.all
        render :index 
    end 

    def show
        @opera = Opera.find(params[:id])
    end 

    def destroy
        @opera = Opera.find(params[:id])
        @opera.destroy
        redirect_to operas_path
    end 
    
end
