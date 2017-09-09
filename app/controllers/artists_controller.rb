class ArtistsController < ApplicationController
  def index
    @artists = Artist.all
  end

  def show
    @artist = Artist.find(params[:id])
    @song = @artist.songs
  end

  def destroy
    @artist = Artist.find(params[:id])

    if @artist.destroy
      redirect_to artists_path
    else
      redirect_to artist_path
    end
  end
end
