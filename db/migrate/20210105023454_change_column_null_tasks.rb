class ChangeColumnNullTasks < ActiveRecord::Migration[5.2]
  def change
    change_column :tasks, :name, :string, null: false
    change_column :tasks, :Details, :string, null: false
    change_column :tasks, :status, :string, null: false, default: "in progress"
  end
end
