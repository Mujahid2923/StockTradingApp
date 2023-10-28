# frozen_string_literal: true

# db/migrate/20231027075333_create_orders.rb
class CreateOrders < ActiveRecord::Migration[6.1]
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
