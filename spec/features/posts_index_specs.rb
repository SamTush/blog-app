require 'rails_helper'
require 'capybara/rspec'

RSpec.describe 'Post index page', type: :feature do
  let!(:user) { create(:user) }
  let!(:post) { create(:post, user: user) }

  before do
    visit posts_path
  end

  it "displays the post's title, body, and user's photo" do
    within("#post-#{post.id}") do
      expect(page).to have_css('.title', text: post.title)
      expect(page).to have_css('.body', text: post.body)
      expect(page).to have_css("img[src='#{user.photo}']")
    end
  end
end
