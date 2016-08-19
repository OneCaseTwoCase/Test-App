class DataStore < ActiveRecord::Migration
   def up
    create_table :data do |t|
      t.column "first_name", :string, :limit => 25
      t.string "last_name", :limit => 50
      #t.datetime "created_at"
      #t.datetime "updated_at"
      t.timestamps
    end
  end

  def down
  	drop_table :data
  end

end