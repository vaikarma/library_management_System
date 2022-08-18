class AddFineToBooks < ActiveRecord::Migration[6.1]
  def change
    add_column :books, :late_fess, :integer
  end
end
