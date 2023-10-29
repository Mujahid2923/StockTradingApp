# frozen_string_literal: true

class CreateOrders < ActiveRecord::Migration[6.1] # rubocop:disable Style/Documentation
  def change
    create_table :orders do |t|
      t.integer :quantity
      t.integer :price
      t.integer :status, default: 0

      t.references :user, foreign_key: true
      t.references :business, foreign_key: true

      t.timestamps
    end
  end
end
