# frozen_string_literal: true

class CreateRoles < ActiveRecord::Migration[6.1] # rubocop:disable Style/Documentation
  def change
    create_table :roles do |t|
      t.integer :name, null: false, index: { unique: true }

      t.timestamps
    end
  end
end
