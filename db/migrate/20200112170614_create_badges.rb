# frozen_string_literal: true

class CreateBadges < ActiveRecord::Migration[6.0]
  def change
    create_table :badges do |t|
      t.string :title, null: false
      t.string :icon_url, default: 'https://clipartsworld.com/images/clipart-ribbon-png-6.png', null: false
      t.references :badge_rule, index: true, null: false

      t.timestamps
    end
  end
end
