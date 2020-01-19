# frozen_string_literal: true

class CreateBadgeRules < ActiveRecord::Migration[6.0]
  def change
    create_table :badge_rules do |t|
      t.string :title, null: false

      t.integer :level, default: -1
      t.references :category, index: true, default: -1
      t.integer :attempt, default: -1

      t.boolean :attempt_badge, default: false, null: false
      t.boolean :category_badge, default: false, null: false
      t.boolean :level_badge, default: false, null: false
    end
  end
end
