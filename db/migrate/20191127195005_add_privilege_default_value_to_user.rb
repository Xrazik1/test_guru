# frozen_string_literal: true

class AddPrivilegeDefaultValueToUser < ActiveRecord::Migration[6.0]
  def change
    change_column :users, :privilege, :string, default: 'user'
  end
end
