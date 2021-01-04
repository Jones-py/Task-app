class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :name, null: false, default: false
      t.string :Details, null: false, default: false

      t.timestamps
    end
  end
end
