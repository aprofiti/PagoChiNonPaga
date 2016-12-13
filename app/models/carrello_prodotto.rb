class CarrelloProdotto < ActiveRecord::Base
  # Gemma Carrello
  acts_as_shopping_cart_item_for :carrello

  def name
  end

end
