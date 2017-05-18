require 'rails_helper'

RSpec.feature "User views all playlists" do
  scenario "they see each playlist's name" do
    playlists = create_list(:playlist_with_songs, 2)

    visit playlists_path

    playlists.each do |playlist|
      expect(page).to have_link playlist.name, href: playlists_path(playlist)
    end
  end
end
