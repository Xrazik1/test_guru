# frozen_string_literal: true

class DropJoinTableUsersTests < ActiveRecord::Migration[6.0]
  def up
    drop_table :users_tests, if_exists: true
  end
end
