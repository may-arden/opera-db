class NotesController < ApplicationController

  before_action :redirect_if_not_logged_in, only: [:index, :show]
  before_action :find_note, only: [:show, :edit, :update, :destroy]

  def new
    @song = Song.find_by_id(params[:song_id])
    @note = Note.new(song_id: @song.id)
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
    @notes = @song.notes 
  end 

  def show 
    @song = Song.find_by_id(params[:song_id])
    @notes = Note.all 
  end 

  def most_recent
    @note = Note.most_recent
    render :show
  end 

  def edit
    if @note.user_id != current_user.id 
      @error = "this is not your note - editing is not permitted"
      render :show
    end 
  end 

  def update
    @note.update(note_params)
      if @note.valid? 
        redirect_to note_path
      else 
        render :edit
      end 
  end 

  def destroy
    @note.destroy
    redirect_to notes_path
  end 

  private

  def note_params
    params.require(:note).permit(:title, :content, :song_id, :user_id)
  end 

  def find_note
    @note = Note.find_by_id(params[:id])
  end 

end
