class CreateCubeTypes < ActiveRecord::Migration
  def change
    create_table :cube_types do |t|

      t.timestamps null: false
    end
  end
end
