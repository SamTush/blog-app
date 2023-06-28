require 'rails_helper'
require 'capybara/rspec'
require 'factory_bot_rails'

RSpec.describe 'User list page', type: :feature do
  before(:each) do
    @users = [
      create(:user),
      create(:user)
    ]
  end

  it "redirects to a user's show page when their profile picture or name is clicked" do
    visit users_path

    first('.user-profile-pic a').click

    expect(current_path).to eq(user_path(@users.first))

    visit users_path

    first('.user-info h3 a').click

    expect(current_path).to eq(user_path(@users.first))
  end
end
