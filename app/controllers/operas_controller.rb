class OperasController < ApplicationController
    before_action :redirect_if_not_logged_in, only: [:show, :index]

    def show
        @opera = Opera.find(params[:id])
    end 

    def index
        @operas = Opera.all 
    end 

    def destroy
        @opera = Opera.find(params[:id])
        @opera.destroy
        redirect_to operas_path
    end 
    
end
