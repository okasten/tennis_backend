class CreateCoaches < ActiveRecord::Migration[5.2]
  def change
    create_table :coaches do |t|
      t.string :name
      t.string :username
      t.string :password_digest
      t.string :email
      t.string :picture
      t.string :location

      t.timestamps
    end
  end
end
