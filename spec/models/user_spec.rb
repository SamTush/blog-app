require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'associations' do
    it { should have_many(:posts).with_foreign_key('author_id') }
    it { should have_many(:comments) }
    it { should have_many(:likes) }
  end

  describe '#recent_posts' do
    let(:user) { User.create(name: 'John Doe') }
    let!(:post1) { Post.create(title: 'Post 1', author: user, created_at: 1.day.ago) }
    let!(:post2) { Post.create(title: 'Post 2', author: user, created_at: 2.days.ago) }
    let!(:post3) { Post.create(title: 'Post 3', author: user, created_at: 3.days.ago) }
  end
end
