class AddRateToProviders < ActiveRecord::Migration
  def change
    add_column :providers, :rate, :decimal
    add_column :providers, :unit, :string
  end
end
