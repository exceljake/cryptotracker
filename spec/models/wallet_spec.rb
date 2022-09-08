require 'rails_helper'

RSpec.describe Wallet, type: :model do
  wallet = Wallet.new 

  it "should fail without wallet_type" do
    wallet.wallet_type = ""
    wallet.save
    expect(wallet).to_not be_valid
  end
end
