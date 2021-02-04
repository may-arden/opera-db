class NotesController < ApplicationController

  # before_action :redirect_if_not_authorized
  # before_action :redirect_if_not_logged_in

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
    # @notes = Note.find_by(params[:song_id])
    # byebug
    @notes = @song.notes 
  end 

  def show 
    @song = Song.find_by_id(params[:song_id])
    @note = Note.find_by_id(params[:id])
    @notes = Note.all 

  end 

  def edit
    @note = Note.find_by_id(params[:id])
  end 

  def update
    @note = Note.find(params[:id])
    @note.update(note_params)
      if @note.valid? 
        redirect_to note_path
      else 
        render :edit
      end 
  end 

  def destroy
    @note = Note.find(params[:id])
    @note.destroy
    redirect_to notes_path
  end 



  private

  def note_params
    params.require(:note).permit(:title, :content, :song_id, :user_id)
  end 

end
