require 'rails_helper'
require 'capybara/rspec'

RSpec.describe 'User post show page', type: :feature do
  let!(:user) { create(:user) }
  let!(:post) { create(:post, user:) }
  let!(:comments) { create_list(:comment, 3, post:) }

  before do
    visit user_post_path(user, post)
  end

  it "displays the post's title, author, comments, likes, body, and commentors" do
    within('#post-show-page') do
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
        expect(page).to have_css('li', count: comments.count)

        comments.each do |comment|
          expect(page).to have_content("#{User.find_by(id: comment.user_id).name}: #{comment.text}")
        end
      end
    end
  end
end
