class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :name
      t.string :Details
      t.string :status
      t.timestamps
    end
  end
end
