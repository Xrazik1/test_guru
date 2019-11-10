class CreateTests < ActiveRecord::Migration[6.0]
  def change
    create_table :tests do |t|
      t.string :title, null: false
      t.integer :level, null: false, default: 0
      t.integer :category_id, null: false

      t.timestamps
    end
  end
end
