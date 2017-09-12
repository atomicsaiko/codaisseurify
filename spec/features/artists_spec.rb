require 'rails_helper'

describe "User" do
  let!(:artist) { create :artist }

  it "can delete an artist" do
    visit artist_path(artist)
    click_link 'Delete artist'

    expect(page).to_not have_content artist.name
  end

  it "can add a song" do
    visit artist_path(artist)
    fill_in "Song name" , with: 'One Note Samba'
    # click_link 'Add song'
    click_button 'Add song'

    expect(page).to have_content 'One Note Samba'
  end
end
