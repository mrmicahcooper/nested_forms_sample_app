module OrderHelper
  def order_label(order)
    order.ordered_at.to_s(:us) + " - " +  order.vendor + " - " + order.reference
  end
end
