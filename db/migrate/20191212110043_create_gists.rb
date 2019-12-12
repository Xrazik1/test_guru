# frozen_string_literal: true

class CreateGists < ActiveRecord::Migration[6.0]
  def change
    create_table :gists do |t|
      t.string :url, null: false

      t.references :user, index: true
      t.references :question, index: true
    end
  end
end
