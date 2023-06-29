require 'rails_helper'
require 'capybara/rspec'
require 'factory_bot_rails'

RSpec.describe 'User index page', type: :feature do
  before(:each) do
    @users = FactoryBot.create_list(:user, 2)
  end

  it "displays the name, profile picture, and number of posts for each user" do
    visit users_path

    @users.each do |user|
      within("#user-#{user.id}") do
        expect(page).to have_content(user.name)
        expect(page).to have_selector("img[src='#{user.photo}']")
        expect(page).to have_content("Number of posts: #{user.posts_counter || 0}")
      end
    end
  end

  it "redirects to a user's show page when their profile picture is clicked" do
    visit users_path

    first('.user-profile-pic a').click
    expect(current_path).to eq(user_path(@users.first))
  end

  it "redirects to a user's show page when their name is clicked" do
    visit users_path

    first('.user-info h3 a').click
    expect(current_path).to eq(user_path(@users.first))
  end
end
