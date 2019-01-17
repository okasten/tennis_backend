class FixTypeColumn < ActiveRecord::Migration[5.2]
  def change
    rename_column :goals, :type, :kind
  end
end
