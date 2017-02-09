require 'rails_helper'

RSpec.describe Prodotto, type: :model do
  it "is invalid without a nome" do
    prodotto= Prodotto.new(nome:"",prezzo: 0, qta: 0, descrizione: "prodotto", impresa_id: 1, eliminato: false)
    expect(prodotto).not_to be_valid
  end
  it "is invalid without a prezzo" do
    prodotto= Prodotto.new(nome:"prodotto", qta: 0, descrizione: "prodotto", impresa_id: 1, eliminato: false)
    expect(prodotto).not_to be_valid
  end
  it "is invalid without a qta" do
    prodotto= Prodotto.new(nome:"prodotto",prezzo: 0, descrizione: "prodotto", impresa_id: 1, eliminato: false)
    expect(prodotto).not_to be_valid
  end
  it "is invalid without a descrizione" do
    prodotto= Prodotto.new(nome:"prodotto",prezzo: 0, qta: 0, descrizione: "", impresa_id: 1, eliminato: false)
    expect(prodotto).not_to be_valid
  end
  it "is invalid without a impresa_id" do
    prodotto= Prodotto.new(nome:"prodotto",prezzo: 0, qta: 0, descrizione: "prodotto", eliminato: false)
    expect(prodotto).not_to be_valid
  end
  it "is invalid with a nome with special characters" do
    prodotto= Prodotto.new(nome:"prodotto?",prezzo: 0, qta: 0, descrizione: "prodotto", impresa_id: 1, eliminato: false)
    expect(prodotto).not_to be_valid
  end
  it "is invalid if is already in the db" do
    Prodotto.create(nome:"prodotto",prezzo: 0, qta: 0, descrizione: "prodotto", impresa_id: 1, eliminato: false)

    prodotto= Prodotto.new(nome:"prodotto",prezzo: 0, qta: 0, descrizione: "prodotto", impresa_id: 1, eliminato: false)
    prodotto.valid?

    expect(prodotto.errors[:base]).to include("Prodotto già presente.")
  end
end
