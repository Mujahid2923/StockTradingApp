# frozen_string_literal: true

class CreateBusinesses < ActiveRecord::Migration[6.1] # rubocop:disable Style/Documentation
  def change
    create_table :businesses do |t|
      t.string :name
      t.integer :shares_available

      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
