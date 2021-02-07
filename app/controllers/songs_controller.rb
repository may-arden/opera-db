class SongsController < ApplicationController
  include SongsHelper 
  before_action :redirect_if_not_logged_in, only: [:new, :index, :show, :edit]
  before_action :find_song, only: [:show, :edit, :update]

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
          render :new 
        end 

    end 

    def index
      @songs = Song.all
    end 

    def show
    end 

    def edit
    end 

    def update
      @song.update(song_params)
        if @song.valid? 
          redirect_to song_path
        else
          render :edit
        end 
    end 

    def destroy
      if @song.user_id != current_user.id
        redirect_to song_path
      else
      @song.destroy
      redirect_to songs_path
      end 
    end 

    private

    def song_params
      params.require(:song).permit(:title, opera_attributes: [:name])
    end 

    def find_song
      @song = Song.find(params[:id])
    end 

end
