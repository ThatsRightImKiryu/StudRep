class AddIndexToInput < ActiveRecord::Migration[7.0]
  def change
    add_index :twins, :input, unique: true
  end
end
