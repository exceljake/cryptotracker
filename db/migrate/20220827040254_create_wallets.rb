class CreateWallets < ActiveRecord::Migration[7.0]
  def change
    create_table :wallets do |t|
      t.decimal :overall_worth, default: 0.0
      t.string :wallet_type
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
