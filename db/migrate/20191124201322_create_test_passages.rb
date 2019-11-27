# frozen_string_literal: true

class CreateTestPassages < ActiveRecord::Migration[6.0]
  def change
    create_table :test_passages do |t|
      t.references :user, index: true
      t.references :test, index: true
      t.references :current_question, index: true
      t.integer :correct_questions, default: 0

      t.timestamps
    end
  end
end
