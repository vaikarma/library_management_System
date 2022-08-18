class AddToatlfineToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :totalfine, :integer,:default => 0
  end
end
