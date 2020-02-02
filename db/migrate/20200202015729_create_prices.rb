class CreatePrices < ActiveRecord::Migration[6.0]
  def change
    create_table :prices do |t|
      t.decimal :value
      t.string :currency, limit: 5
      t.references :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
