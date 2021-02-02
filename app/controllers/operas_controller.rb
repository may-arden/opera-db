class OperasController < ApplicationController

    def index
        @operas = Opera.all
        render :index 
    end 
    
end
