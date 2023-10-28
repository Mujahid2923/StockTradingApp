# frozen_string_literal: true

# db/migrate/20231027063222_create_businesses.rb
class CreateBusinesses < ActiveRecord::Migration[6.1]
  def change
    create_table :businesses do |t|
      t.string :name
      t.integer :shares_available

      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
