
#db/schema.rb

ActiveRecord::Schema.define(:version => 20120501123614) do

  create_table "items", :force => true do |t|
    t.integer  "quantity"
    t.string   "product"
    t.decimal  "price",      :precision => 8, :scale => 2
    t.decimal  "decimal",    :precision => 8, :scale => 2
    t.integer  "order_id"
    t.datetime "created_at",                               :null => false
    t.datetime "updated_at",                               :null => false
  end

  create_table "orders", :force => true do |t|
    t.string   "reference"
    t.date     "ordered_at"
    t.string   "vendor"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
