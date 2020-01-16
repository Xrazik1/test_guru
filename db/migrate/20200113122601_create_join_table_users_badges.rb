# frozen_string_literal: true

class CreateJoinTableUsersBadges < ActiveRecord::Migration[6.0]
  def change
    create_join_table :users, :badges do |t|
      t.index %i[user_id badge_id]
    end
  end
end
