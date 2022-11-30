class CreateTwins < ActiveRecord::Migration[7.0]
  def change
    create_table :twins do |t|
      t.integer :input, null: false
      t.string :twins, null: false

      t.timestamps
    end
  end
end
