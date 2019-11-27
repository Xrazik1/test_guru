# frozen_string_literal: true

class ChangeAnswersSetCorrectToBoolean < ActiveRecord::Migration[6.0]
  def up
    remove_column :answers, :correct
    add_column :answers, :correct, :boolean
  end
end
