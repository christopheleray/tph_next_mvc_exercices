# frozen_string_literal: true

# frozen_string_literal: true.

class AddNameToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :name, :string, presence: true
  end
end
