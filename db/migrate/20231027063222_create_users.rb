# frozen_string_literal: true

# db/migrate/20231027064524_create_users.rb
class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name

      t.references :role, foreign_key: true

      t.timestamps
    end
  end
end
