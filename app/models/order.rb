class Order < ActiveRecord::Base

  has_many :items
  accepts_nested_attributes_for :items

end
