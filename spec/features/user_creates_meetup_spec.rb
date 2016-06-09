require 'spec_helper'
require 'pry'

feature "User signs in" do
  let!(:user) do
    User.create(
      provider: "github",
      uid: "1",
      username: "jarlax1",
      email: "jarlax1@launchacademy.com",
      avatar_url: "https://avatars2.githubusercontent.com/u/174825?v=3&s=400"
    )
  end


  scenario "user visits /meetups/new page" do
    visit '/'

    click_link('Create a Meetup!')
    expect(page).to have_current_path('/meetups/new/create')
  end

  scenario "user submits a new meetup by signing-in and visiting the new page" do
    visit '/'
    sign_in_as user
    click_link('Create a Meetup!')

    fill_in "name", with: "Jim's bbq"
    fill_in "location", with: "Brighton"
    fill_in "description", with: "lots of pigeon meat. lots of milk."

    click_button "Submit"
    expect(page).to have_current_path("/meetups/#{Meetup.last.id}")
    expect(page).to have_content("Meetup created successfully!")
  end

  scenario "user signs in and only fills in two fields then tries to submit" do
    visit '/'
    sign_in_as user
    visit '/meetups/new/create'

    fill_in "Location", with: "chinatown"
    fill_in "Description", with: "an interesting smell"
    click_button "Submit"
    expect(page).to have_current_path("/meetups/new/create")
    expect(page).to have_content("some type of error")
  end
end
