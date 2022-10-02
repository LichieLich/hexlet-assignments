class AddColumnsToTasks < ActiveRecord::Migration[6.1]
  def change
    add_column :tasks, :name, :string, nullable: false
    add_column :tasks, :description, :string
    add_column :tasks, :status, :string, nullable: false
    add_column :tasks, :creator, :string, nullable: false
    add_column :tasks, :performer, :string
    add_column :tasks, :completed, :boolean, nullable: false
  end
end
