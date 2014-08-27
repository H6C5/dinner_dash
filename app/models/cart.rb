class Cart < ActiveRecord::Base
  has_many :cart_items, dependent: :destroy
  has_many :items, through: :cart_items

  def add_item(item_id)
    current_item = cart_items.find_by(item_id: item_id)
    if current_item
      current_item.quantity += 1
    else
      current_item = cart_items.create(item_id: item_id)
    end
    current_item
  end


  def total_price
    cart_items.to_a.sum { |cart_item| cart_item.total_price }
  end

  def total_items
    cart_items.sum(:quantity)
  end

end

# model level validation on CartItem -> friendly errors
