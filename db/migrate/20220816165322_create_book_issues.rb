class CreateBookIssues < ActiveRecord::Migration[6.1]
  def change
    create_table :book_issues do |t|
      t.references :user, null: false, foreign_key: true
      t.references :book, null: false, foreign_key: true
      t.date       :issue_date
      t.date :return_date
      t.timestamps
    end
  end
end
