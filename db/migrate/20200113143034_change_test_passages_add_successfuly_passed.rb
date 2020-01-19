# frozen_string_literal: true

class ChangeTestPassagesAddSuccessfulyPassed < ActiveRecord::Migration[6.0]
  def change
    change_table :test_passages do |t|
      t.boolean :successfully_passed, default: false
    end
  end
end
