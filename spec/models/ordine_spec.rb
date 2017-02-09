require 'rails_helper'

RSpec.describe Ordine, type: :model do
  it "is invalid without a cliente_id" do
    ordine= Ordine.new(impresa_id: 1, stato_ordine_id: 1, totale: 0, spedizione: 0)

    ordine.prodotti << Prodotto.create(nome:'Minestra di cozze', prezzo: 50, qta: 10,
     descrizione: 'Minestra bella', impresa_id: 1, eliminato: false)

    expect(ordine).not_to be_valid
  end
  it "is invalid without a impresa_id" do
    ordine= Ordine.new(cliente_id: 1, stato_ordine_id: 1, totale: 0, spedizione: 0)
    ordine.prodotti << Prodotto.create(nome:'Minestra di cozze', prezzo: 50, qta: 10,
     descrizione: 'Minestra bella', impresa_id: 1, eliminato: false)

    expect(ordine).not_to be_valid
  end
  it "is invalid without a stato_ordine_id" do
    ordine= Ordine.new(cliente_id: 1, impresa_id: 1, totale: 0, spedizione: 0)
    ordine.prodotti << Prodotto.create(nome:'Minestra di cozze', prezzo: 50, qta: 10,
     descrizione: 'Minestra bella', impresa_id: 1, eliminato: false)


    expect(ordine).not_to be_valid
  end
  it "is invalid without a prodotto" do
    ordine= Ordine.new(cliente_id: 1, impresa_id: 1, stato_ordine_id: 1, totale: 0, spedizione: 0)

    expect(ordine).not_to be_valid
  end
  it "is invalid with a not numeric totale" do
    ordine= Ordine.new(cliente_id: 1, impresa_id: 1, stato_ordine_id: 1, totale: "ciao", spedizione: 0)
    ordine.prodotti << Prodotto.create(nome:'Minestra di cozze', prezzo: 50, qta: 10,
     descrizione: 'Minestra bella', impresa_id: 1, eliminato: false)

    expect(ordine).not_to be_valid
  end
end
