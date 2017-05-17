require 'rails_helper'

RSpec.feature "User edits an existing artist" do
  scenario "they see updated info for one artist" do
    artist = Artist.create(name: "Bob Marley",
                  image_path: "http://cps-static.rovicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg"
    )
    new_name = "Jimmi Hendrix"

    visit artist_path(artist)
    click_on "Edit"

    visit edit_artist_path(artist)
    expect(page).to have_content "Edit An Artist"
    fill_in "artist_name", with: new_name
    click_on "Update Artist"

    expect(page).to have_content new_name
    expect(page).to_not have_content artist.name
    expect(page).to have_css("img[src=\"#{artist.image_path}\"]")
  end
end
