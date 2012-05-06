
#app/controllers/orders_controller.rb

class OrdersController < ApplicationController

  #using the decent_exposure gem
  expose(:orders) { Order.all }
  expose(:order)
  expose(:order_items) { order.items }
  expose(:items) do
    if order_items.present?
      order_items
    else
      order_items.build
    end
  end

  def create
    save_and_show('new')
  end

  def update
    save_and_show('edit')
  end

  private

  def save_and_show(view)
    if order.save
      redirect_to order_path(order)
    else
      render view
    end
  end
  hide_action :save_and_show

end
