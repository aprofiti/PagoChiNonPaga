class Polo < ActiveRecord::Base

  has_many :admins
  has_many :citta

  belongs_to :admin

end
