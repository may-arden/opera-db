class NotesController < ApplicationController

  def new
    @song = Song.find_by_id(params[:song_id])
    @note = Note.new(song_id: @song.id)
    # @note.user_id = session[:user_id]
  end

  def create
    @song = Song.find_by_id(params[:song_id])
    @note = current_user.notes.build(note_params)
      if @note.save
        redirect_to song_path(@song)
      else 
        render :new
      end 
  end 

  def index
    @song = Song.find_by_id(params[:song_id])
    @notes = Note.all 
  end 

  def show 
    
    @song = Song.find_by_id(params[:song_id])

      @note = Note.find_by_id(params[:id])
    @notes = Note.all 

  end 



  private

  def note_params
    params.require(:note).permit(:title, :content, :song_id, :user_id)
  end 

end
