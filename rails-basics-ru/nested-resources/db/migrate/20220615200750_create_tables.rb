class CreateTables < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.text :body
      t.timestamps
    end

    create_table :post_comments do |t|
      t.text :body, null: false
      t.timestamps
      t.references :post
    end
  end
end
