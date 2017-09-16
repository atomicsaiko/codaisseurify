class SongsController < ApplicationController
  before_action :set_artist

  def create
    # @song = @artist.songs.create(song_params)
    #
    # if @song.save
    #   redirect_to @song.artist, notice: "Song added!"
    # else
    #   redirect_to artist_path
    # end

    @song = @artist.songs.create(song_params)

    respond_to do |format|
      if @song.save
        format.html { redirect_to @song.artist, notice: "Song added!" }
        # format.json { render @artist, status: :created, location: @song }
        # format.json { redirect_to @song.artist, status: :created}
        # format.json { redirect_back fallback_location: root_path, status: :created}
        format.json { render template: "artists/show", status: :created}
        # format.json { render @song.artist, status: :created}


      else
        format.html { redirect_to artist_path }
        format.json { render json: @song.errors, status: :unprocessable_entity }
      end
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
