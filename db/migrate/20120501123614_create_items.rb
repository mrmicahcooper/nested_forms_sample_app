class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.integer :quantity
      t.string  :product
      t.decimal :price, :decimal, precision: 8, scale: 2

      t.references :order
      t.timestamps
    end
  end
end
