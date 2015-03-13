# Create the entry model table
class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.references :feed, null: false, foreign_key: true
      t.string :content

      t.timestamps null: false
    end
  end
end
