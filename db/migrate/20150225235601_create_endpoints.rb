class CreateEndpoints < ActiveRecord::Migration
  def change
    create_table :endpoints do |t|
      t.string :kimono_id, null: false
      t.datetime :last_polled_at

      t.timestamps null: false
    end
    add_index :endpoints, :kimono_id, unique: true
  end
end
