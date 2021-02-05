module SongsHelper

    def song_params
      params.require(:song).permit(:title, opera_attributes: [:name])
    end 

    def find_song
      @song = Song.find(params[:id])
    end 
    
end
