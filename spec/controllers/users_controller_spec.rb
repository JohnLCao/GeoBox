require "rails_helper"

RSpec.describe UsersController, type: :controller do
  let(:user) { FactoryBot.create(:user) }
  describe "#index" do
    context "as an admin user" do
      it "responds successfully" do
        login_as_admin
        get :index
        expect(response).to be_success
      end
    end

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

  describe "#show" do
    context "as an authorized user" do
      it "responds successfully" do
        login(user)
        get :show, id: user.id
        expect(response).to be_success
      end
    end

    context "as an unauthorized user" do
      it "redirects to login page" do
        get :show, id: ""
        expect(response).to redirect_to login_path
      end
    end
  end

  describe "#update" do
    context "as an authorized user" do
      before do
        @user = FactoryBot.create(:user)
      end
      it "responds successfully" do
        user_params = FactoryBot.attributes_for(:user, username: "new_user_name")
        login(@user)
        patch :update, id: @user.id, user: user_params
        expect(@user.reload.username).to eq "new_user_name"
      end
    end

    # context "as an unauthorized user" do
    #   it "redirects to login page" do
    #     get :show, id: ""
    #     expect(response).to redirect_to login_path
    #   end
    # end
  end

end
