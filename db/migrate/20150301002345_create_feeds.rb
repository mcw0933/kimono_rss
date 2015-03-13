# Create the feed model table
class CreateFeeds < ActiveRecord::Migration
  def change
    create_table :feeds do |t|
      t.references :endpoint, null: false, foreign_key: true

      t.timestamps null: false
    end
  end
end
