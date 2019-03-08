require 'rails_helper'

RSpec.describe WallsController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      user = User.create(user_name: 'testUser', email: 'test@test.com', password: "password", password_confirmation: "password")
      sign_in user
      get :index

      expect(response).to have_http_status(:success)
      sign_out user
    end
  end

end
