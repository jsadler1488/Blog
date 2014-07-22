class RemoveAvailAmountFromFunds < ActiveRecord::Migration
  def change
    remove_column :funds, :avail_amount, :int
  end
end
