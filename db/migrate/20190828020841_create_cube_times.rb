class CreateCubeTimes < ActiveRecord::Migration
  def change
    create_table :cube_times do |t|
      t.float :cube_time
      t.timestamps null: false
    end
  end
end
