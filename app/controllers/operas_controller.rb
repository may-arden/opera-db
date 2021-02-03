class OperasController < ApplicationController

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
