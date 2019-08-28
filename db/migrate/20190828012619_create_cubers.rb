class CreateCubers < ActiveRecord::Migration
  def change
    create_table :cubers do |t|
        t.string :name
        t.string :state
        t.string :country
        t.string :password_digest
      t.timestamps null: false
    end
  end
end
