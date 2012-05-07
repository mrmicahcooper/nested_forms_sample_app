
#app/controllers/orders_controller.rb

class OrdersController < ApplicationController

  #using decent_exposure
  expose(:orders) { Order.all }
  expose(:order)
  expose(:items) { order.items }

  def new
    3.times { items.build }
  end

  def create
    order.save ? redirect_to(order_path(order)) : render('new')
  end

  def update
    order.save ? redirect_to(order_path(order)) : render('edit')
  end

end
