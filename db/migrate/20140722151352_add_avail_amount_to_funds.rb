class AddAvailAmountToFunds < ActiveRecord::Migration
  def change
    add_column :funds, :avail_amount, :decimal, precision: 8, scale: 2
  end
end
