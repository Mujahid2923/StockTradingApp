# frozen_string_literal: true

# db/migrate/20231027075333_create_roles.rb
class CreateRoles < ActiveRecord::Migration[6.1]
  def change
    create_table :roles do |t|
      t.integer :name, null: false, index: { unique: true }

      t.timestamps
    end
  end
end
