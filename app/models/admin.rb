class Admin < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :polo

  # Validations necessarie per la registrazione
  validates :email, :password, :password_confirmation, presence: true
  validate :unique_entry #custom validation

  # Custom validation per controllare unicita tra piu campi senza case_sensitive
  def unique_entry
    matched_entry = Admin.where(['LOWER(email) = LOWER(?)', self.email]).first #il '?' e' un parametro per SQL passato da self.campo
    errors.add(:base, 'Email già utilizzata.') if matched_entry && (matched_entry.id != self.id) #se non sono io stesso allora c'e' un errore
  end

  def superadmin?
    true
  end

  # Necessario per mostrare il nome dell'Entita in RailsAdmin
  def name
    self.email.to_s
  end
end
