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
      @songs = Songs.all
    end 

    def show
    end 

    def edit
    end 

end
