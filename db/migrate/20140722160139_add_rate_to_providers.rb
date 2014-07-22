class AddRateToProviders < ActiveRecord::Migration
  def change
    add_column :providers, :rate, :decimal, precision: 8, scale: 2
  end
end
