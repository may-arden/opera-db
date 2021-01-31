class OperasController < ApplicationController

    def index
        @operas = Opera.alpha 
    end 
    
end
