class CreateConversations < ActiveRecord::Migration[5.2]
  def change
    create_table :conversations do |t|
      t.belongs_to :player, foreign_key: true
      t.belongs_to :coach, foreign_key: true

      t.timestamps
    end
  end
end
