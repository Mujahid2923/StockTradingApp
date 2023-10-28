# frozen_string_literal: true

class CreatePermissions < ActiveRecord::Migration[6.1] # rubocop:disable Style/Documentation
  def change
    create_table :permissions do |t|
      t.string :resource, null: false
      t.jsonb :actions, null: false, default: {}, index: true
      t.references :accessor, polymorphic: true

      t.timestamps
    end
    add_index :permissions, %i[resource accessor_id accessor_type], unique: :case_insensitive_comparision
  end
end
