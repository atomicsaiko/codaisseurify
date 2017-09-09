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

  private

  def set_artist
    @artist = Artist.find(params[:artist_id])
  end

  def song_params
    params.require(:song).permit(:name, :artist_id)
  end
end
