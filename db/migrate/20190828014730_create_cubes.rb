class CreateCubes < ActiveRecord::Migration
  def change
    create_table :cubes do |t|
      t.string :type
      t.timestamps null: false
    end
  end
end