class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :reference
      t.date   :ordered_at
      t.string :vendor

      t.timestamps
    end
  end
end
