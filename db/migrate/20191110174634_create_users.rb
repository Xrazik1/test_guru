# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :surname
      t.string :password, null: false
      t.string :email, null: false
      t.string :privilege, null: false
      t.string :test_ids

      t.timestamps
    end
  end
end
