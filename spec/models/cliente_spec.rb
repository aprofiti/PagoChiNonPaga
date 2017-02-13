require 'rails_helper'

RSpec.describe Cliente, type: :model do
  Citta.create(nome: :Messina,regione: :Sicilia, provincia: :ME,polo_id: 1)
  Citta.create(nome: :Palermo,regione: :Sicilia, provincia: :PA,polo_id: 2)

  it "is invalid without a nome" do
    cliente= Cliente.new(nome: '', cognome: 'Gates', cf: 'oaooaoaoa', telefono: '12345', data_nascita: Date.parse('31/12/1992'),
     email: 'boh@boh.it', password: '123456', password_confirmation: '123456', indirizzo: 'via catania n.1', citta_id: 1,
     confirmed_at: Date.parse('01/01/2017'))

     expect(cliente).not_to be_valid
  end
  it "is invalid without a cognome" do
    cliente= Cliente.new(nome: 'Bill', cognome: '', cf: 'oaooaoaoa', telefono: '12345', data_nascita: Date.parse('31/12/1992'),
     email: 'boh@boh.it', password: '123456', password_confirmation: '123456', indirizzo: 'via catania n.1', citta_id: 1,
     confirmed_at: Date.parse('01/01/2017'))

     expect(cliente).not_to be_valid
  end
  it "is invalid without a cf" do
    cliente= Cliente.new(nome: 'Bill', cognome: 'Gates', cf: '', telefono: '12345', data_nascita: Date.parse('31/12/1992'),
     email: 'boh@boh.it', password: '123456', password_confirmation: '123456', indirizzo: 'via catania n.1', citta_id: 1,
     confirmed_at: Date.parse('01/01/2017'))

     expect(cliente).not_to be_valid
  end
  it "is invalid without a telefono" do
    cliente= Cliente.new(nome: 'Bill', cognome: 'Gates', cf: 'amclmlm', telefono: '', data_nascita: Date.parse('31/12/1992'),
     email: 'boh@boh.it', password: '123456', password_confirmation: '123456', indirizzo: 'via catania n.1', citta_id: 1,
     confirmed_at: Date.parse('01/01/2017'))

     expect(cliente).not_to be_valid
  end
  it "is invalid without a data_nascita" do
    cliente= Cliente.new(nome: 'Bill', cognome: 'Gates', cf: 'amclmlm', telefono: '66565656',
     email: 'boh@boh.it', password: '123456', password_confirmation: '123456', indirizzo: 'via catania n.1', citta_id: 1,
     confirmed_at: Date.parse('01/01/2017'))

     expect(cliente).not_to be_valid
  end
  it "is invalid without a email" do
    cliente= Cliente.new(nome: 'Bill', cognome: 'Gates', cf: 'oaooaoaoa', telefono: '12345', data_nascita: Date.parse('31/12/1992'),
     email: '', password: '123456', password_confirmation: '123456', indirizzo: 'via catania n.1', citta_id: 1,
     confirmed_at: Date.parse('01/01/2017'))

     expect(cliente).not_to be_valid
  end
  it "is invalid without a password and password_confirmation" do
    cliente= Cliente.new(nome: 'Bill', cognome: 'Gates', cf: 'oaooaoaoa', telefono: '12345', data_nascita: Date.parse('31/12/1992'),
     email: 'boh@boh.it', password: '', password_confirmation: '', indirizzo: 'via catania n.1', citta_id: 1,
     confirmed_at: Date.parse('01/01/2017'))

     expect(cliente).not_to be_valid
  end
  it "is invalid with a different password and password_confirmation" do
    cliente= Cliente.new(nome: 'Bill', cognome: 'Gates', cf: 'oaooaoaoa', telefono: '12345', data_nascita: Date.parse('31/12/1992'),
     email: 'boh@boh.it', password: '123456', password_confirmation: '654321', indirizzo: 'via catania n.1', citta_id: 1,
     confirmed_at: Date.parse('01/01/2017'))

     expect(cliente).not_to be_valid
  end
  it "is invalid without a indirizzo" do
    cliente= Cliente.new(nome: 'Bill', cognome: 'Gates', cf: 'oaooaoaoa', telefono: '12345', data_nascita: Date.parse('31/12/1992'),
     email: 'boh@boh.it', password: '123456', password_confirmation: '123456', indirizzo: '', citta_id: 1,
     confirmed_at: Date.parse('01/01/2017'))

     expect(cliente).not_to be_valid
  end
  it "is invalid with a nome with special characters" do
    cliente= Cliente.new(nome: 'Bill!', cognome: 'Gates', cf: 'oaooaoaoa', telefono: '12345', data_nascita: Date.parse('31/12/1992'),
     email: 'boh@boh.it', password: '123456', password_confirmation: '123456', indirizzo: 'via catania n.1', citta_id: 1,
     confirmed_at: Date.parse('01/01/2017'))

     expect(cliente).not_to be_valid
  end
  it "is invalid with a cognome with special characters" do
    cliente= Cliente.new(nome: 'Bill', cognome: 'Gates?', cf: 'oaooaoaoa', telefono: '12345', data_nascita: Date.parse('31/12/1992'),
     email: 'boh@boh.it', password: '123456', password_confirmation: '123456', indirizzo: 'via catania n.1', citta_id: 1,
     confirmed_at: Date.parse('01/01/2017'))

     expect(cliente).not_to be_valid
  end
  it "is invalid if is already in the db" do
    Cliente.create(nome: 'Bill', cognome: 'Gates', cf: 'oaooaoaoa', telefono: '12345', data_nascita: Date.parse('31/12/1992'),
     email: 'boh@boh.it', password: '123456', password_confirmation: '123456', indirizzo: 'via catania n.1', citta_id: 1,
     confirmed_at: Date.parse('01/01/2017'))

     cliente= Cliente.new(nome: 'Bill', cognome: 'Gates', cf: 'oaooaoaoa', telefono: '12345', data_nascita: Date.parse('31/12/1992'),
      email: 'boh2@boh.it', password: '123456', password_confirmation: '123456', indirizzo: 'via catania n.1', citta_id: 2,
      confirmed_at: Date.parse('01/01/2017'))

    cliente.valid?
    expect(cliente.errors[:nome])
  end
  it "is invalid if has an email already in the db" do
    Cliente.create(nome: 'Bill', cognome: 'Gates', cf: 'oaooaoaoa', telefono: '12345', data_nascita: Date.parse('31/12/1992'),
     email: 'boh@boh.it', password: '123456', password_confirmation: '123456', indirizzo: 'via catania n.1', citta_id: 1,
     confirmed_at: Date.parse('01/01/2017'))

     cliente= Cliente.new(nome: 'Steve', cognome: 'Jobs', cf: 'soodksodk', telefono: '12345', data_nascita: Date.parse('31/12/1991'),
      email: 'boh@boh.it', password: '123456', password_confirmation: '123456', indirizzo: 'via catania n.1', citta_id: 2,
      confirmed_at: Date.parse('01/01/2017'))

      cliente.valid?

      expect(cliente.errors[:email])
  end
  it "is invalid if has a not numeric telefono" do
     cliente= Cliente.new(nome: 'Steve', cognome: 'Jobs', cf: 'soodksodk', telefono: 'microsoft', data_nascita: Date.parse('31/12/1991'),
      email: 'boh@boh.it', password: '123456', password_confirmation: '123456', indirizzo: 'via catania n.1', citta_id: 2,
      confirmed_at: Date.parse('01/01/2017'))

      expect(cliente).not_to be_valid
  end
end
