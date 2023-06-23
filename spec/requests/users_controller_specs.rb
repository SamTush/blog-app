RSpec.describe UsersController, type: :request do
    describe "GET /users" do
      it "returns a successful response" do
        get "/users"
        expect(response).to have_http_status(200)
      end
    end
  
    describe "GET /users/:id" do
      let(:user) { User.create(name: "John Doe") }
  
      it "returns a successful response" do
        get "/users/#{user.id}"
        expect(response).to have_http_status(200)
      end
    end
  end
  