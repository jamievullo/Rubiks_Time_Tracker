class CreateCubes < ActiveRecord::Migration
  def change
    create_table :cubes do |t|
      t.integer :cube_times_id 
      t.integer :cube_types_id 
      t.timestamps null: false
    end
  end
end
