require 'rails_helper'

RSpec.describe Titolare, type: :model do
  it "is invalid without a nome" do
    titolare= Titolare.new(nome: '', cognome: 'Cognome', email: 'boh@boh.it', password: '123456', password_confirmation: '123456', telefono: '46498',
    piva: "abcde", data_nascita: Date.parse('04/11/1991'), cf: 'adbajdb', indirizzo: 'via via', citta_id: 1,email_paypal: "fakeaccount@account.com", confirmed_at: Date.parse('01/01/2017'))

    expect(titolare).not_to be_valid
  end
  it "is invalid without a cognome" do
    titolare= Titolare.new(nome: 'Nome', cognome: '', email: 'boh@boh.it', password: '123456', password_confirmation: '123456', telefono: '46498',
    piva: "abcde", data_nascita: Date.parse('04/11/1991'), cf: 'adbajdb', indirizzo: 'via via', citta_id: 1,email_paypal: "fakeaccount@account.com", confirmed_at: Date.parse('01/01/2017'))

    expect(titolare).not_to be_valid
  end
  it "is invalid without a email" do
    titolare= Titolare.new(nome: 'Nome', cognome: 'Cognome', email: '', password: '123456', password_confirmation: '123456', telefono: '46498',
    piva: "abcde", data_nascita: Date.parse('04/11/1991'), cf: 'adbajdb', indirizzo: 'via via', citta_id: 1,email_paypal: "fakeaccount@account.com", confirmed_at: Date.parse('01/01/2017'))

    expect(titolare).not_to be_valid
  end
  it "is invalid without a password and password_confirmation" do
    titolare= Titolare.new(nome: 'Nome', cognome: 'Cognome', email: 'boh@boh.it', password: '', password_confirmation: '', telefono: '46498',
    piva: "abcde", data_nascita: Date.parse('04/11/1991'), cf: 'adbajdb', indirizzo: 'via via', citta_id: 1,email_paypal: "fakeaccount@account.com", confirmed_at: Date.parse('01/01/2017'))

    expect(titolare).not_to be_valid
  end
  it "is invalid with different password and password_confirmation" do
    titolare= Titolare.new(nome: 'Nome', cognome: 'Cognome', email: 'boh@boh.it', password: '123456', password_confirmation: '654321', telefono: '46498',
    piva: "abcde", data_nascita: Date.parse('04/11/1991'), cf: 'adbajdb', indirizzo: 'via via', citta_id: 1,email_paypal: "fakeaccount@account.com", confirmed_at: Date.parse('01/01/2017'))

    expect(titolare).not_to be_valid
  end
  it "is invalid without a telefono" do
    titolare= Titolare.new(nome: 'Nome', cognome: 'Cognome', email: 'boh@boh.it', password: '123456', password_confirmation: '123456', telefono: '',
    piva: "abcde", data_nascita: Date.parse('04/11/1991'), cf: 'adbajdb', indirizzo: 'via via', citta_id: 1,email_paypal: "fakeaccount@account.com", confirmed_at: Date.parse('01/01/2017'))

    expect(titolare).not_to be_valid
  end
  it "is invalid without a piva" do
    titolare= Titolare.new(nome: 'Nome', cognome: 'Cognome', email: 'boh@boh.it', password: '123456', password_confirmation: '123456', telefono: '46498',
    piva: "", data_nascita: Date.parse('04/11/1991'), cf: 'adbajdb', indirizzo: 'via via', citta_id: 1,email_paypal: "fakeaccount@account.com", confirmed_at: Date.parse('01/01/2017'))

    expect(titolare).not_to be_valid
  end
  it "is invalid without a data_nascita" do
    titolare= Titolare.new(nome: 'Nome', cognome: 'Cognome', email: 'boh@boh.it', password: '123456', password_confirmation: '123456', telefono: '46498',
    piva: "abcde", cf: 'adbajdb', indirizzo: 'via via', citta_id: 1,email_paypal: "fakeaccount@account.com", confirmed_at: Date.parse('01/01/2017'))

    expect(titolare).not_to be_valid
  end
  it "is invalid without a cf" do
    titolare= Titolare.new(nome: 'Nome', cognome: 'Cognome', email: 'boh@boh.it', password: '123456', password_confirmation: '123456', telefono: '46498',
    piva: "abcde", data_nascita: Date.parse('04/11/1991'), cf: '', indirizzo: 'via via', citta_id: 1,email_paypal: "fakeaccount@account.com", confirmed_at: Date.parse('01/01/2017'))

    expect(titolare).not_to be_valid
  end
  it "is invalid without a indirizzo" do
    titolare= Titolare.new(nome: 'Nome', cognome: 'Cognome', email: 'boh@boh.it', password: '123456', password_confirmation: '123456', telefono: '46498',
    piva: "abcde", data_nascita: Date.parse('04/11/1991'), cf: 'idjaid', indirizzo: '', citta_id: 1,email_paypal: "fakeaccount@account.com", confirmed_at: Date.parse('01/01/2017'))

    expect(titolare).not_to be_valid
  end
  it "is invalid with a nome with special chars" do
    titolare= Titolare.new(nome: 'Nome?', cognome: 'Cognome', email: 'boh@boh.it', password: '123456', password_confirmation: '123456', telefono: '46498',
    piva: "abcde", data_nascita: Date.parse('04/11/1991'), cf: 'dkak', indirizzo: 'via via', citta_id: 1,email_paypal: "fakeaccount@account.com", confirmed_at: Date.parse('01/01/2017'))

    expect(titolare).not_to be_valid
  end
  it "is invalid with a cognome with special chars" do
    titolare= Titolare.new(nome: 'Nome', cognome: 'Cognome?', email: 'boh@boh.it', password: '123456', password_confirmation: '123456', telefono: '46498',
    piva: "abcde", data_nascita: Date.parse('04/11/1991'), cf: 'dkak', indirizzo: 'via via', citta_id: 1,email_paypal: "fakeaccount@account.com", confirmed_at: Date.parse('01/01/2017'))

    expect(titolare).not_to be_valid
  end
  it "is invalid with non standard email" do
    titolare= Titolare.new(nome: 'Nome', cognome: 'Cognome', email: 'boh', password: '123456', password_confirmation: '123456', telefono: '46498',
    piva: "abcde", data_nascita: Date.parse('04/11/1991'), cf: 'dkak', indirizzo: 'via via', citta_id: 1,email_paypal: "fakeaccount@account.com", confirmed_at: Date.parse('01/01/2017'))

    expect(titolare).not_to be_valid
  end
  it "is invalid with non numeric telefono" do
    titolare= Titolare.new(nome: 'Nome', cognome: 'Cognome', email: 'boh@boh.it', password: '123456', password_confirmation: '123456', telefono: 'ciao',
    piva: "abcde", data_nascita: Date.parse('04/11/1991'), cf: 'dkak', indirizzo: 'via via', citta_id: 1,email_paypal: "fakeaccount@account.com", confirmed_at: Date.parse('01/01/2017'))

    expect(titolare).not_to be_valid
  end
  it "is invalid if is already in the db" do
    Titolare.create(nome: 'Nome', cognome: 'Cognome', email: 'boh@boh.it', password: '123456', password_confirmation: '123456', telefono: '4646',
    piva: "abcde", data_nascita: Date.parse('04/11/1991'), cf: 'dkak', indirizzo: 'via via', citta_id: 1,email_paypal: "fakeaccount@account.com", confirmed_at: Date.parse('01/01/2017'))

    titolare= Titolare.new(nome: 'Nome', cognome: 'Cognome', email: 'boh@boh.it', password: '123456', password_confirmation: '123456', telefono: '4646',
    piva: "abcde", data_nascita: Date.parse('04/11/1991'), cf: 'dkak', indirizzo: 'via via', citta_id: 1,email_paypal: "fakeaccount@account.com", confirmed_at: Date.parse('01/01/2017'))

    titolare.valid?

    expect(titolare.errors[:nome])
  end
end
