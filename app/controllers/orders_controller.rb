class OrdersController < ApplicationController

  expose(:orders) { Order.all }
  expose(:order) #Order.find(id) or Order.new
  expose(:order_items) { order.items } #array of Item objects
  expose(:items) do
    if order_items.present? # if order_items has Item objects (not a new order)
      order_items # Use those items
    else # otherwise
      order_items.build # make a new item object and associate it with the order
    end
  end

  #controller actions

  #NOTE: If an action is not defined, rails will
  # try to render a view that matches the
  # action_name and is in the controller directory
  # (e.g. order#new will render app/views/orders/new.html.haml)

  def create
    save_and_show('new')
  end

  def update
    save_and_show('edit')
  end

  private

  def save_and_show(view)
    if order.save # if order is valid
      redirect_to orders_path # go back to the index page
    else # if order if invalid
      render view
    end
  end
  hide_action :save_and_show

end
