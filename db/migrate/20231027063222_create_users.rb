# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[6.1] # rubocop:disable Style/Documentation
  def change
    create_table :users do |t|
      t.string :name

      t.references :role, foreign_key: true

      t.timestamps
    end
  end
end
