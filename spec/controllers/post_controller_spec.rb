require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  describe 'GET index' do
    it 'does not have N+1 query issues' do
      Bullet.enable = true
      Bullet.raise = true

      expect do
        get :index, params: { user_id: create(:user).id }
      end.not_to raise_exception

      Bullet.perform_out_of_channel_notifications if Bullet.notification?
    end
  end
end
