require "test_helper"

class CryptocurrenciesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cryptocurrency = cryptocurrencies(:one)
  end

  test "should get index" do
    get cryptocurrencies_url, as: :json
    assert_response :success
  end

  test "should create cryptocurrency" do
    assert_difference("Cryptocurrency.count") do
      post cryptocurrencies_url, params: { cryptocurrency: { currency: @cryptocurrency.currency, latest_price: @cryptocurrency.latest_price, quantity: @cryptocurrency.quantity, total_worth: @cryptocurrency.total_worth, wallet_id: @cryptocurrency.wallet_id } }, as: :json
    end

    assert_response :created
  end

  test "should show cryptocurrency" do
    get cryptocurrency_url(@cryptocurrency), as: :json
    assert_response :success
  end

  test "should update cryptocurrency" do
    patch cryptocurrency_url(@cryptocurrency), params: { cryptocurrency: { currency: @cryptocurrency.currency, latest_price: @cryptocurrency.latest_price, quantity: @cryptocurrency.quantity, total_worth: @cryptocurrency.total_worth, wallet_id: @cryptocurrency.wallet_id } }, as: :json
    assert_response :success
  end

  test "should destroy cryptocurrency" do
    assert_difference("Cryptocurrency.count", -1) do
      delete cryptocurrency_url(@cryptocurrency), as: :json
    end

    assert_response :no_content
  end
end
