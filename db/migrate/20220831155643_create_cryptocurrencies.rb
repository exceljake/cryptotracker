class CreateCryptocurrencies < ActiveRecord::Migration[7.0]
  def change
    create_table :cryptocurrencies do |t|
      t.string :currency
      t.decimal :latest_price
      t.decimal :quantity
      t.decimal :total_worth
      t.references :wallet, null: false, foreign_key: true

      t.timestamps
    end
  end
end
