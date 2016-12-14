class Impresa < ActiveRecord::Base
  belongs_to :citta
  belongs_to :titolare
  has_many :prodotti
  has_many :ordini
  has_and_belongs_to_many :sottocategorie

  # Necessario per mostrare il nome dell'Entita in RailsAdmin
  def name
    self.nome
  end

  def getTitolare
    self.titolare.getNome
  end

  def getCitta
    self.citta.getNome
  end

  def getIndirizzo
    # TODO
  end

  def getCategorie
    categorie =[]
    self.sottocategorie.each do |sottocategoria|
      categorie << [sottocategoria.categoria.nome]
    end
    categorie
  end

  def getSottocategorie
    nomi=[]
    self.sottocategorie.each do |sottocategoria|
      nomi << [sottocategoria.nome, sottocategoria.categoria.nome]
    end
    nomi
  end

end
