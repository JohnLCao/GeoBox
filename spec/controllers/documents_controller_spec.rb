require "rails_helper"

RSpec.describe DocumentsController, type: :controller do
  let(:user) { FactoryBot.create(:user) }
  describe "#index" do
    context "as an admin user" do
      it "responds successfully" do
        login_as_admin
        get :index
        expect(response).to be_success
      end
    end

    # it should respond successfully to index page for the owner
    context "as not an admin user" do
      it "responds unsucessfully for regular user" do
        login(user)
        get :index
        expect(response).to_not be_success
      end

      it "responds unsucessfully for guest" do
        get :index
        expect(response).to_not be_success
      end

      it "redirects to the login page" do
        get :index
        expect(response).to redirect_to login_path
      end
    end
  end

end
