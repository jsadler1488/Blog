class RemoveAgeFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :age, :int
  end
end
