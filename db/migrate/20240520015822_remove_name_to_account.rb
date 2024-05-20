# frozen_string_literal: true

class RemoveNameToAccount < ActiveRecord::Migration[7.1]
  def up
    remove_column :accounts, :name
  end
end
