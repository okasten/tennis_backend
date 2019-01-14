class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.string :time
      t.string :date
      t.string :subject
      t.boolean :read
      t.string :to
      t.string :from
      t.text :content
      t.belongs_to :conversation, foreign_key: true

      t.timestamps
    end
  end
end
