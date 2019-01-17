class ChangeKindToBeString < ActiveRecord::Migration[5.2]
  def change
    change_column :goals, :kind, :string
  end
end
