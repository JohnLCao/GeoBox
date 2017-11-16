require "rails_helper"

RSpec.describe DocumentsController, type: :controller do
  describe "#index" do
    context "as an admin user" do
      it "responds successfully" do
        login_as_admin
        get :index
        expect(response).to be_success
      end
    end
  end
end
