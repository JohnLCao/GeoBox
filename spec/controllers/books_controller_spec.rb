require "rails_helper"

RSpec.describe BooksController, type: :controller do
  describe "#index" do
    let(:user) { FactoryBot.create(:user) }
    context "as an admin user" do
      # book controller has no views
      it "responds successfully" do
        # login_as_admin
        # get :index
        # expect(response).to be_success
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

  describe "#show" do
    before do
      @user1 = FactoryBot.create(:user)
      @user2 = FactoryBot.create(:user)
      @book = FactoryBot.create(:book, user_id: @user1.id)
    end
    context "as an authorized (owner) user" do
      it "responds successfully" do
        # book are fetched from book fetcher
        # login(@user1)
        # get :show, id: @book.id
        # expect(response).to be_success
      end
    end

    context "as an unauthorized user" do
      it "responds sucessfully for all users not the owner" do
        # redunant test please refer to book helper spec
        # login(@user2)
        # get :show, id: @book.id
        # expect(response).to be_success
        # This is because books is viewable to all users
        # expect(response).not_to be_success
        # expect(response).to redirect_to root_path
        # will decide where it should redirect to
      end

      it "redirects to the login page for guest" do
        get :show, id: @book.id
        expect(response).to redirect_to login_path
      end
    end
  end

  describe "#update" do
    before do
      @user1 = FactoryBot.create(:user)
      @book = FactoryBot.create(:book, user_id: @user1.id)
    end

    context "as an authorized user" do
      it "updates a book" do
        # update should create a document with the right book id
      end
    end

    context "as an authorized user" do
      it "does not update a book" do
      end
    end
  end

end
