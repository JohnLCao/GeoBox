require "rails_helper"

RSpec.describe UsersController, type: :controller do
  describe "#index" do
    let(:user) { FactoryBot.create(:user) }
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
    let(:user) { FactoryBot.create(:user) }
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

  describe "#create" do
    context "with valid input" do
      it "adds a new user" do
        user_params = { username: "new_user_name", email: "new_email@geobox.com", password: "simple", password_confirmation: "simple" }
        expect {
          post :create, {user: user_params}
        }.to change(User.all, :count).by(1)
        expect(flash[:success]).to eq "User was successfully created."
      end
    end

    context "with invalid input" do
      it "does not add a new user" do
        user_params = { username: "new_user_name", email: "invalid_email", password: "simple", password_confirmation: "simple" }
        expect {
          post :create, {user: user_params}
        }.not_to change(User.all, :count)
      end
    end
  end

  describe "#update" do
    context "as an authorized user" do
      before do
        @user = FactoryBot.create(:user, email: "old_email@geobox.com")
      end

      it "updates a user" do
        user_params = FactoryBot.attributes_for(:user, username: "new_user_name")
        login(@user)
        patch :update, id: @user.id, user: user_params
        expect(@user.reload.username).to eq "new_user_name"
        expect(response).to redirect_to @user_path
        expect(flash[:info]).to include "User was successfully updated."
      end

      it "does not update a user when updating params is invalid" do
        user_params = FactoryBot.attributes_for(:user, email: "invalid_email_format")
        login(@user)
        patch :update, id: @user.id, user: user_params
        expect(@user.reload.email).to eq "old_email@geobox.com"
        expect(response).to render_template(:edit)
        expect(flash[:danger]).not_to be_nil
      end
    end
  end

  describe "#destroy" do
    context "as an admin user" do
      before do
        @user = FactoryBot.create(:user)
      end
      it "deletes a user" do
        login_as_admin
        expect {
          delete :destroy, id: @user.id
        }.to change(User.all, :count).by(-1)
        expect(flash[:success]).to include "User was successfully destroyed"
        expect(response).to redirect_to users_path
      end
    end
  end
end
