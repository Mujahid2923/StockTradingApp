# frozen_string_literal: true

class CreatePurchases < ActiveRecord::Migration[6.1] # rubocop:disable Style/Documentation
  def change
    create_table :purchases do |t|
      t.integer :quantity
      t.integer :price

      t.references :user, foreign_key: true
      t.references :business, foreign_key: true

      t.timestamps
    end
  end
end
