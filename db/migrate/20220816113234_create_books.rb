class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.string :book_name
      t.string :title
      t.string :author
      t.integer :price
      t.integer :stoke
      t.date :publish_date
      t.references :user, null: false, foreign_key: true
      t.string :publication_name
      t.timestamps
    end
  end
end
