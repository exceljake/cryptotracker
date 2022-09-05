class AddOverallPnlToWallets < ActiveRecord::Migration[7.0]
  def change
    add_column :wallets, :overall_pnl, :decimal, default: 0.0
  end
end
