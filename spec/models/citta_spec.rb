require 'rails_helper'

RSpec.describe Citta, type: :model do
  it "is invalid without a nome" do
    citta= Citta.new(nome:"", provincia:"Messina", regione:"Sicilia",polo_id:1)
    expect(citta).not_to be_valid
  end
  it "is invalid without a provincia" do
    citta= Citta.new(nome:"Messina", provincia:"", regione:"Sicilia",polo_id:1)
    expect(citta).not_to be_valid
  end
  it "is invalid without a regione" do
    citta= Citta.new(nome:"Messina", provincia:"Messina", regione:"",polo_id:1)
    expect(citta).not_to be_valid
  end
  it "is invalid without a polo_id" do
    citta= Citta.new(nome:"Messina", provincia:"Messina", regione:"Sicilia")
    expect(citta).not_to be_valid
  end
  it "is invald if is already in the db with the same provincia and regione" do
    Citta.create(nome:"Gotham", provincia:"Gotham", regione:"Molise",polo_id:1)
    citta= Citta.new(nome:"Gotham", provincia:"Gotham", regione:"Molise",polo_id:3)
    citta.valid?
    expect(citta.errors[:base]).to include('Città già esistente')
  end
end
