class OrdersController < ApplicationController

  #using decent_exposure
  expose(:orders) { Order.all }
  expose(:order)
  expose(:items) { order.items }

  def new
    3.times { items.build }
  end

  def create
    persist_or('new')
  end

  def update
    persist_or('edit')
  end

  private

  def persist_or(view)
    order.save ? redirect_to(order_path(order)) : render(view)
  end

end
