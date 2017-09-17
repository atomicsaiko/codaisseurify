require 'rails_helper'

feature 'Artist library', js: true do
  scenario 'add a new song' do
    visit root_path
    # visit('/artists/1')
    page.should have_content('Yiruma')
    click_link 'Yiruma'
    fill_in 'song-input', with: 'Big Yellow Taxi'
    click_link 'add-song'
    expect(page).to have_content('Big Yellow Taxi')
  end

  scenario 'delete a song' do
    visit root_path
    click_link 'Yiruma'
    click_link 'delete-song' # It should click the first matching link it finds
    expect(page).to_not have_content('Blind Film')
  end

  scenario 'delete all songs' do
    visit root_path
    click_link 'Yiruma'
    click_link 'delete-all-songs'
    expect(page).to_not have_content('Blind Film')
    expect(page).to_not have_content('Waltz in E minor [For Cello]')
    expect(page).to_not have_content('Piano Quartet No.1 in A-Flat')
    # OR number of li elements should be zero
  end
end
