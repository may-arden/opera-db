module NotesHelper

  def note_params
    params.require(:note).permit(:title, :content, :song_id, :user_id)
  end 

  def find_note
    @note = Note.find_by_id(params[:id])
  end 
  
end
