class AddUserIdToCryptocurrencies < ActiveRecord::Migration[7.0]
  def change
    add_column :cryptocurrencies, :user_id, :integer
  end
end
