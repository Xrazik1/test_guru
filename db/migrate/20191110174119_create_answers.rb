class CreateAnswers < ActiveRecord::Migration[6.0]
  def change
    create_table :answers do |t|
      t.string :body, null: false
      t.string :correct, null: false, default: 'false'
      t.integer :test_id, null: false

      t.timestamps
    end
  end
end
