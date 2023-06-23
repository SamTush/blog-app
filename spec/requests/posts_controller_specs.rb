RSpec.describe PostsController, type: :controller do
  describe "GET #index" do
    it "returns a successful response" do
      get :index
      expect(response).to have_http_status(200)
      expect(response).to render_template(:index)
      expect(response.body).to include("Posts Index") # Replace with correct placeholder text
    end
  end

  describe "GET #show" do
    let(:post) { create(:post) }

    it "returns a successful response" do
      get :show, params: { id: post.id }
      expect(response).to have_http_status(200)
      expect(response).to render_template(:show)
      expect(response.body).to include("Post Details") # Replace with correct placeholder text
    end
  end
end
