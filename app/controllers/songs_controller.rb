class SongsController < ApplicationController

  before_action :redirect_if_not_logged_in
  before_action :redirect_if_not_authorized


    def new
      @song = Song.new
      @song.build_opera
    end

    def create
      @song = Song.new(song_params)
      
      @song.user_id = session[:user_id]
      
        if 
          @song.save
          redirect_to song_path(@song)
        else 
          @error = "please make sure to fill in both fields"
          render :new 
        end 
    end 

    def index
      @songs = Song.all
    end 

    def show
      redirect_if_not_logged_in
      redirect_if_not_authorized
        @song = Song.find(params[:id])
    end 

    def edit
      @song = Song.find(params[:id])
    end 

    def update
      @song = Song.find(params[:id])
      @song.update(song_params)
        if @song.valid? 
          redirect_to song_path
        else 
          @error = "please make sure to fill in both fields"
          render :edit
        end 
    end 

    def destroy
      @song = Song.find(params[:id])
      @song.destroy
      redirect_to songs_path
    end 

    private 

    def song_params
      params.require(:song).permit(:title, opera_attributes: [:name])
    end 

end
