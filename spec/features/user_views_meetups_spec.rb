require 'spec_helper'

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

    let!(:party1) do
      Meetup.create(
        name: "happy time",
        location: "LA",
        description: "jimmy's salami party",
        creator: user
      )
    end


  scenario "view list of all available meetups" do
    visit '/meetups'

    expect(page).to have_content("happy time")
  end

  scenario "view page of a single meetup and see info" do
    visit '/meetups'
    click_link('happy time')

    expect(page).to have_content("happy time")
    expect(page).to have_content("LA")
    expect(page).to have_content("jimmy's salami party")
    expect(page).to have_content(user.username)
  end
end
