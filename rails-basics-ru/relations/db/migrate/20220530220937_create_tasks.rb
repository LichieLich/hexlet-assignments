# frozen_string_literal: true

class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.belongs_to :status
      t.belongs_to :user
      t.string :name, null: false
      t.string :description

      t.timestamps
    end
  end
end
