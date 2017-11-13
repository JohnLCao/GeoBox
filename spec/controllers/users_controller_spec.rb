require "rails_helper"

RSpec.describe UsersController, type: :controller do
  describe "#index" do
    it "responds successfully for admin" do
      login_as_admin
      get :index
      expect(response).to be_success
    end

    it "responds unsucessfully for regular user" do
      login(FactoryBot.create(:user))
      get :index
      expect(response).not_to be_success
    end
  end
end
