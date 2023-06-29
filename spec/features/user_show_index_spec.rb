require 'rails_helper'
require 'capybara/rspec'

RSpec.describe 'User show page', type: :feature do
  let(:user) { create(:user) }

  before do
    visit user_path(user)
  end

  it "displays the user's information, bio, and posts" do
    expect(page).to have_css('h3', text: user.name)
    expect(page).to have_css("img[src='#{user.photo}'][alt='profile-picture']")
    expect(page).to have_css('.posts-counter', text: "Number of posts: #{user.posts_counter || 0}")
    expect(page).to have_css('.bio', text: user.bio)
  end

  it "has a 'See all posts' button" do
    expect(page).to have_link('See all posts', href: user_posts_path(user))
  end

  it "navigates to the 'See all posts' page when the button is clicked" do
    click_link('See all posts', match: :first)
    expect(current_path).to eq(user_posts_path(user))
  end

  it "has 'Home', 'Back', and 'Create post' buttons" do
    expect(page).to have_link('Home', href: '../../')
    expect(page).to have_css('.back-link')
    expect(page).to have_link('Create post', href: new_user_post_path(user))
  end
end
