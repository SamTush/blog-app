require 'rails_helper'
require 'capybara/rspec'

RSpec.describe 'User show page integration', type: :feature do
  let!(:user) { create(:user) }
  let!(:post) { create(:post, user:) }
  let!(:comments) { create_list(:comment, 3, post:) }

  before do
    visit user_path(user)
  end

  it "displays the user's post, comments, and forms" do
    within('#user-page') do
      expect(page).to have_link('Home', href: '../../')
      expect(page).to have_link('Back', href: :back)
      expect(page).to have_link('Users', href: users_path)

      within('.single-post-container') do
        expect(page).to have_css('.title', text: post.title)
        expect(page).to have_css('.user-name', text: "by #{user.name}")
        expect(page).to have_css('.posts-counter',
                                 text: "Comment: #{post.comment_counter || 0}, Likes: #{post.likes_counter || 0}")
        expect(page).to have_css('.post-body', text: post.text)
      end

      within('.comments-container') do
        comments.each do |comment|
          expect(page).to have_content("#{User.find_by(id: comment.user_id).name}: #{comment.text}")
        end
      end

      within('.form-container:first-child') do
        expect(page).to have_css('h3', text: 'Create Post')
        expect(page).to have_field('Title')
        expect(page).to have_field('Text')
        expect(page).to have_button('Create Post')
      end

      within('.form-container:nth-child(2)') do
        expect(page).to have_css('h3', text: 'Add Comment')
        expect(page).to have_field('Text')
        expect(page).to have_button('Add Comment')
      end

      within('.like-button-container') do
        expect(page).to have_button('Like')
      end
    end
  end
end
