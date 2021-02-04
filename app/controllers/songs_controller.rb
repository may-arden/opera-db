class SongsController < ApplicationController
before_action :redirect_if_not_logged_in, only: [:new, :index, :show, :edit]

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
        @song = Song.find(params[:id])
    end 

    def edit
      redirect_if_not_authorized
      @song = Song.find(params[:id])
      # byebug
    end 

    def update
      @song = Song.find(params[:id])
      @song.update(song_params)
        if @song.valid? 
          redirect_to song_path
        else
          render :edit
        end 
    end 

    def destroy
      @song = Song.find(params[:id])
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

end
