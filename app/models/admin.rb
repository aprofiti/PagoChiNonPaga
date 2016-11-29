class Admin < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :polo

  # Necessario per mostrare il nome dell'Entita in RailsAdmin
  def name
    self.email.to_s
  end
end
