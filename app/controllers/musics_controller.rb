class MusicsController <ApplicationController
  before_action :set_music, only: [ :edit,:update, :destroy]
  before_action :set_artist_id, only: [:index, :new, :edit] 
  before_action :set_artist, only: [:edit, :update]

  def index
    @musics = Music.where(artist_id: @artist_id)
  end

  def show

  end

  def new
    @music=Music.new
  end

  def create
    @music=Music.new(music_params)
    if @music.save
      flash[:notice]="Music Saved Successfully"
      redirect_to artist_musics_path
    else
      render :new, status: :unprocessable_entity
    end
  end




  def edit
  end


  def update
    
    if @music.update(music_params)
      flash[:notice] = "Music is Updated Successfully"
      redirect_to artist_musics_path(artist_id: @artist.id)
    else
      render :edit, status: :unprocessable_entity
    end
  end




  def destroy
    if @music.destroy
      flash[:notice] = "Music Deleted Successfully"
      redirect_to artist_musics_path
    end
  end


  
  private

  def set_artist_id
    @artist_id = params[:artist_id]
  end

  def set_music
    @music = Music.find(params[:id])
  end 

  def set_artist
    @artist = Artist.find(params[:artist_id])
  end  

  def music_params
    params.require(:music).permit(:title, :album_name, :genre, :artist_id)
  end

end