class OperasController < ApplicationController

    def index
        @operas = Opera.all
        render :index 
    end 

    def show
        @opera = Opera.find(params[:id])
        
    end 
    
end
