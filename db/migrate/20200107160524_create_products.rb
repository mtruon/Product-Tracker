class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name, limit: 255
      t.string :url, limit: 2083
      t.integer :domain

      t.timestamps
    end
    add_index :products, :url, unique: true
  end
end
