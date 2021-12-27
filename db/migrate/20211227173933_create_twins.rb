class CreateTwins < ActiveRecord::Migration[7.0]
  def change
    create_table :twins do |t|
      t.integer :input
      t.string :values

      t.timestamps
    end
    add_index :twins, :input, unique: true
  end
end
