require 'rails_helper'

RSpec.describe Cryptocurrency, type: :model do
  cryptocurrency = Cryptocurrency.new 

  it "should fail without symbol" do
    cryptocurrency.symbol = ""
    cryptocurrency.save
    expect(cryptocurrency).to_not be_valid
  end

  it "should fail without buy_price" do
    cryptocurrency.buy_price = ""
    cryptocurrency.save
    expect(cryptocurrency).to_not be_valid
  end

  it "should fail without quantity" do
    cryptocurrency.quantity = ""
    cryptocurrency.save
    expect(cryptocurrency).to_not be_valid
  end
end
