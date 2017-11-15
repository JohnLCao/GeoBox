require "rails_helper"

RSpec.describe SessionsController, type: :controller do
  describe "#create" do
    context "login as regular user" do
      before do
        @user = FactoryBot.create(:user)
      end
      it "accepts the login with valid username/password" do
        login_params = {username: @user.username, password: @user.password}
        post :create, { user: login_params }
        expect(response).to redirect_to root_path
        expect(session[:user_id]).to eq (@user.id)
        expect(flash[:success]).to include "Logged in succesfully"
      end

      it "does not accept the login with invalid combination username/password" do
        login_params = {username: @user.username, password: "not_password"}
        post :create, { user: login_params }
        expect(response).to redirect_to login_path
        expect(flash[:danger]).to include "Invalid username/password combination!"
      end
    end

    context "login as an admin user" do
      before do
        @admin = FactoryBot.create(:admin)
      end

      it "redirects to admin page" do
        login_params = {username: @admin.username, password: @admin.password}
        post :create, { user: login_params }
        expect(response).to redirect_to admin_root_path
      end
    end
  end

  describe "#destroy" do
    it "reset the session" do
      expect(session[:user_id]).to be_nil
    end
  end

end
