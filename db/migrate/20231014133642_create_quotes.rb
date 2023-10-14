class CreateQuotes < ActiveRecord::Migration[7.0]
  def change
    create_table :quotes do |t|
      t.date :pubyear, null: false
      t.text :quotetext, null: false
      t.text :comment, null: true
      t.boolean :is_public, default: false
      t.references :user, null: false, foreign_key: true
      t.references :philosopher, null: false, foreign_key: true

      t.timestamps
    end
  end
end
