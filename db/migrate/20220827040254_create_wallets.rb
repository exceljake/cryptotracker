class CreateWallets < ActiveRecord::Migration[7.0]
  def change
    create_table :wallets do |t|
      t.decimal :overall_worth
      t.string :wallet_type

      t.timestamps
    end
  end
end
