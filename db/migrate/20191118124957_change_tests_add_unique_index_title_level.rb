# frozen_string_literal: true

class ChangeTestsAddUniqueIndexTitleLevel < ActiveRecord::Migration[6.0]
  def change
    change_table :tests do |t|
      t.index %i[title level], unique: true
    end
  end
end
