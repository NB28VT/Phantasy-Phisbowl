require 'spec_helper'

feature "User submits predictions %Q{ As a nerdy Phishhead, I would like to be able to submit predictions for the
  songs Phish will play in the following setlist spots before every show:

  * Set 1 opener
  * Set 1 closer
  * Set 2 opener
  * Set 2 closer
  * Encore
  * Cover song (a song by another band that is not a Phish solo band)
  * Elemental song (relating to an earth element, like fire, light etc.)
  * Gamehendge song (a song the references the band's fictional universe,
  Gamehendge (http://en.wikipedia.org/wiki/Gamehendge))
  * Five wild card songs that could appear anywhere
  * A song about an animal
  * A song with a name as a title
  * A song about a place}" do

  scenario "User can submit predictions, and get a message when they submit." do
    visit '/PhantasyPhootball/Predictions'
    fill_in('S1 Opener', with: 'Wolfman\'s Brother')
    fill_in("S1 Closer", with: "Anarchy in the U.K.")
    fill_in("S2 Opener", with: "Golden Age")
    fill_in("S2 Closer", with: "Harry Hood")
    fill_in("Encore", with: "Sleeping Monkey")
    click_on "Submit"

    expect(page).to have_content "Predictions submitted!"
  end

  scenario "User can't submit blank fields without getting an error" do
    visit '/PhantasyPhootball/Predictions'
    fill_in('S1 Opener', with: '')
    fill_in("S1 Closer", with: "Anarchy in the U.K.")
    fill_in("S2 Opener", with: "Golden Age")
    fill_in("S2 Closer", with: "Harry Hood")
    fill_in("Encore", with: "Sleeping Monkey")
    click_on "Submit"

    expect(page).to have_content "No blank submissions!"
  end


end
