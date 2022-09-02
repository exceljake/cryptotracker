class CreateCryptocurrencies < ActiveRecord::Migration[7.0]
  def change
    create_table :cryptocurrencies do |t|
      t.string :coingecko_id
      t.string :symbol
      t.decimal :price
      t.decimal :buy_price
      t.decimal :quantity
      t.decimal :total_worth
      t.references :wallet, null: false, foreign_key: true

      t.timestamps
    end
  end
end
