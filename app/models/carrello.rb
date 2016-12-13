class Carrello < ActiveRecord::Base
  # Gemma Carrello
  acts_as_shopping_cart_using :carrello_prodotti  
end
