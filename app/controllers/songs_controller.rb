class SongsController < ApplicationController

    def new
      @song = Song.new
       
    end

    def create
      @song = Song.new(song_params)
      
      @song.user_id = session[:user_id]
      
        if @song.save
          
          redirect_to song_path(@song)
        else 
         
          render :new  
        end 
    end 

    def index 
      @songs = Song.all
    end 

    def show
        @song = Song.find(params[:id])
        
    end 

    def edit
    end 

    private 

    def song_params
      params.require(:song).permit(:title)
    end 

end
