class SongsController < ApplicationController
  before_action :set_artist

  def create
    @song = @artist.songs.create(song_params)

    if @song.save
      redirect_to @song.artist, notice: "Song added!"
    else
      redirect_to artist_path
    end
  end

  def destroy
    @song = Song.find(params[:id])

    if @song.destroy
      redirect_back fallback_location: artists_path, notice: "Song deleted!"
    else
      artist_path @artist
    end
  end

  private

  def set_artist
    @artist = Artist.find(params[:artist_id])
  end

  def song_params
    params.require(:song).permit(:name, :artist_id)
  end
end
