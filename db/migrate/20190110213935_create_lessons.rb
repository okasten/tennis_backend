class CreateLessons < ActiveRecord::Migration[5.2]
  def change
    create_table :lessons do |t|
      t.belongs_to :coach, foreign_key: true
      t.belongs_to :player, foreign_key: true
      t.time :time
      t.date :date
      t.string :duration
      t.string :location
      t.text :notes

      t.timestamps
    end
  end
end
