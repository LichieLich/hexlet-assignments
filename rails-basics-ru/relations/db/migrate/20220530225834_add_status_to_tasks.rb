# frozen_string_literal: true

class AddStatusToTasks < ActiveRecord::Migration[6.1]
  def change
    add_reference :tasks, :status, null: false
  end
end
