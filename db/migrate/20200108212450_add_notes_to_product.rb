class AddNotesToProduct < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :notes, :string, limit: 512
  end
end
