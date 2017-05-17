require 'rails_helper'

RSpec.feature "User views all artists" do
  scenario "they see the name of each artist" do
      artist = Artist.create(name: "Bob Marley",
                    image_path: "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg"
      )

      visit artists_path

      expect(page).to have_content "All Artists"
      expect(page).to have_content "New Artist"
      expect(page).to have_content "Bob Marley"
      expect(page).to have_link artist.name, href: artist_path(artist)
  end
end
