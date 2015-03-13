# Create the schema model table
class CreateSchemas < ActiveRecord::Migration
  # http://edgeapi.rubyonrails.org/classes/ActiveRecord/ConnectionAdapters/TableDefinition.html
  def change
    create_table :schemas do |t|
      t.references :endpoint, null: false, foreign_key: true

      # specifying a default value for the range in the migration is making ActiveRecord unhappy,
      # although Postgres doesn't mind.  Going with model after_init/before_save callback hooks instead.
      t.column :effective, :tstzrange, null: false
      t.column :structure, :json, null: false

      t.timestamps null: false
    end
  end
end
