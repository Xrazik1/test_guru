class FixIndexesJoinTableUsersTests < ActiveRecord::Migration[6.0]
  def change
    change_table :tests_users do |t|
      t.remove_index [:test_id, :user_id]
      t.remove_index [:user_id, :test_id]

      t.index [:user_id, :test_id], unique: true
    end
  end
end
