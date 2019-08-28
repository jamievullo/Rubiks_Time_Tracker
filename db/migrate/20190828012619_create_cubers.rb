class CreateCubers < ActiveRecord::Migration
  def change
    create_table :cubers do |t|
        t.string :name
        t.string :state
        t.string :country
      t.timestamps null: false
    end
  end
end
