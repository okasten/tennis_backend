class CreateGoals < ActiveRecord::Migration[5.2]
  def change
    create_table :goals do |t|
      t.belongs_to :player, foreign_key: true
      t.string :objective
      t.boolean :met
      t.binary :type
      t.string :dateMet
      t.text :notes

      t.timestamps
    end
  end
end
