class CreateCubers < ActiveRecord::Migration
  def change
    create_table :cubers do |t|
        t.string :name
        t.string :country
        t.string :email
        t.string :password_digest
      t.timestamps null: false
    end
  end
end
