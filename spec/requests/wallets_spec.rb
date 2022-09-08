require 'rails_helper'
include ActionController::RespondWith

RSpec.describe "Wallets", type: :request do
  let!(:current_user){FactoryBot.create(:user, :skip_validate)}
  sign_in(:current_user)

  it "returns http success" do
      get "/wallets"
      expect(response).to have_http_status(:success)
  end
end
