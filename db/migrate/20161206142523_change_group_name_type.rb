class ChangeGroupNameType < ActiveRecord::Migration[5.0]
  def change
    remove_column :groups, :name
    add_column :groups, :name, :string
  end
end
