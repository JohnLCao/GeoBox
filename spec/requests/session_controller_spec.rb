require "rails_helper"

def sign_in_as(user)
  session[:user_id] = user.id
end

RSpec.describe "Session controller", :type => :request do
    it "allows user access login page" do
      get "/login"
      expect(response).to have_http_status(:success)
    end

    it "allows admin access the admin page" do
      admin = create(:admin)
      post "/sessions", { user: { username: admin.username, password: admin.password } }
      expect(response).to redirect_to :admin_root
    end


end
