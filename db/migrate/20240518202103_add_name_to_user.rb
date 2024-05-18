# frozen_string_literal: true

class AddNameToUser < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :name, :string
  end
end
