require 'rails_helper'

RSpec.describe Impresa, type: :model do
  it "is invalid without a indirizzo" do
    citta= Citta.create(nome: "Taormina", provincia: "Messina", regione: "Sicilia", polo_id: 1)

    impresa= Impresa.new(nome: 'Impresa', telefono: '45454', descrizione: 'Boh', titolare_id: 1, citta_id: citta.id,
    verificato: true, congelato: false, indirizzo: '', email: 'impre30@sa.it')

    impresa.sottocategorie << Sottocategoria.create(nome: 'Ristoranti', categoria_id: 1)

    expect(impresa).not_to be_valid
  end
  it "is invalid without a nome" do
    citta= Citta.create(nome: "Taormina", provincia: "Messina", regione: "Sicilia", polo_id: 1)

    impresa= Impresa.new(nome: '', telefono: '45454', descrizione: 'Boh', titolare_id: 1, citta_id: citta.id,
    verificato: true, congelato: false, indirizzo: 'piazza Paladini 4', email: 'impre30@sa.it')

    impresa.sottocategorie << Sottocategoria.create(nome: 'Ristoranti', categoria_id: 1)

    expect(impresa).not_to be_valid
  end
  it "is invalid without a telefono" do
    citta= Citta.create(nome: "Taormina", provincia: "Messina", regione: "Sicilia", polo_id: 1)

    impresa= Impresa.new(nome: 'Marmellate spa', telefono: '', descrizione: 'Boh', titolare_id: 1, citta_id: citta.id,
    verificato: true, congelato: false, indirizzo: 'piazza Paladini 4', email: 'impre30@sa.it')

    impresa.sottocategorie << Sottocategoria.create(nome: 'Ristoranti', categoria_id: 1)

    expect(impresa).not_to be_valid
  end
  it "is invalid without a descrizione" do
    citta= Citta.create(nome: "Taormina", provincia: "Messina", regione: "Sicilia", polo_id: 1)

    impresa= Impresa.new(nome: 'Marmellate spa', telefono: '4545454', descrizione: '', titolare_id: 1, citta_id: citta.id,
    verificato: true, congelato: false, indirizzo: 'piazza Paladini 4', email: 'impre30@sa.it')

    impresa.sottocategorie << Sottocategoria.create(nome: 'Ristoranti', categoria_id: 1)

    expect(impresa).not_to be_valid
  end
  it "is invalid without a titolare_id" do
    citta= Citta.create(nome: "Taormina", provincia: "Messina", regione: "Sicilia", polo_id: 1)

    impresa= Impresa.new(nome: 'Marmellate spa', telefono: '45454', descrizione: 'Boh', citta_id: citta.id,
    verificato: true, congelato: false, indirizzo: 'piazza Paladini 4', email: 'impre30@sa.it')

    impresa.sottocategorie << Sottocategoria.create(nome: 'Ristoranti', categoria_id: 1)

    expect(impresa).not_to be_valid
  end
  it "is invalid without a indirizzo" do
    citta= Citta.create(nome: "Taormina", provincia: "Messina", regione: "Sicilia", polo_id: 1)

    impresa= Impresa.new(nome: 'Marmellate spa', telefono: '45454', descrizione: 'Boh', titolare_id: 1, citta_id: citta.id,
    verificato: true, congelato: false, indirizzo: '', email: 'impre30@sa.it')

    impresa.sottocategorie << Sottocategoria.create(nome: 'Ristoranti', categoria_id: 1)

    expect(impresa).not_to be_valid
  end
  it "is invalid with a not numeric telefono" do
    citta= Citta.create(nome: "Taormina", provincia: "Messina", regione: "Sicilia", polo_id: 1)

    impresa= Impresa.new(nome: 'Marmellate spa', telefono: 'boh', descrizione: 'Boh', titolare_id: 1, citta_id: citta.id,
    verificato: true, congelato: false, indirizzo: 'piazza Paladini 4', email: 'impre30@sa.it')

    impresa.sottocategorie << Sottocategoria.create(nome: 'Ristoranti', categoria_id: 1)

    expect(impresa).not_to be_valid
  end
  it "is invalid with a not numeric fax" do
    citta= Citta.create(nome: "Taormina", provincia: "Messina", regione: "Sicilia", polo_id: 1)

    impresa= Impresa.new(nome: 'Marmellate spa', telefono: '123460', fax: "ciao" , descrizione: 'Boh', titolare_id: 1, citta_id: citta.id,
    verificato: true, congelato: false, indirizzo: 'piazza Paladini 4', email: 'impre30@sa.it')

    impresa.sottocategorie << Sottocategoria.create(nome: 'Ristoranti', categoria_id: 1)

    expect(impresa).not_to be_valid
  end
  it "is invalid with a nome with special characters" do
    citta= Citta.create(nome: "Taormina", provincia: "Messina", regione: "Sicilia", polo_id: 1)

    impresa= Impresa.new(nome: 'Marmellate spa?!', telefono: '123460', descrizione: 'Boh', titolare_id: 1, citta_id: citta.id,
    verificato: true, congelato: false, indirizzo: 'piazza Paladini 4', email: 'impre30@sa.it')

    impresa.sottocategorie << Sottocategoria.create(nome: 'Ristoranti', categoria_id: 1)

    expect(impresa).not_to be_valid
  end
  it "is invalid with a sitoweb with not complete url" do
    citta= Citta.create(nome: "Taormina", provincia: "Messina", regione: "Sicilia", polo_id: 1)

    impresa= Impresa.new(nome: 'Marmellate spa', telefono: '123460', descrizione: 'Boh', titolare_id: 1, citta_id: citta.id,
    verificato: true, congelato: false, indirizzo: 'piazza Paladini 4', email: 'impre30@sa.it', sitoweb: "ciao")

    impresa.sottocategorie << Sottocategoria.create(nome: 'Ristoranti', categoria_id: 1)

    expect(impresa).not_to be_valid
  end
  it "is invalid with a facebook with not complete url" do
    citta= Citta.create(nome: "Taormina", provincia: "Messina", regione: "Sicilia", polo_id: 1)

    impresa= Impresa.new(nome: 'Marmellate spa', telefono: '123460', descrizione: 'Boh', titolare_id: 1, citta_id: citta.id,
    verificato: true, congelato: false, indirizzo: 'piazza Paladini 4', email: 'impre30@sa.it', facebook: "ciao")

    impresa.sottocategorie << Sottocategoria.create(nome: 'Ristoranti', categoria_id: 1)

    expect(impresa).not_to be_valid
  end
  it "is invalid if is already in the db" do
    citta= Citta.create(nome: "Taormina", provincia: "Messina", regione: "Sicilia", polo_id: 1)

    impresa1= Impresa.new(nome: 'Marmellate spa', telefono: '123460', descrizione: 'Boh', titolare_id: 1, citta_id: citta.id,
    verificato: true, congelato: false, indirizzo: 'piazza Paladini 4', email: 'impre30@sa.it')

    sottocategoria= Sottocategoria.create(nome: 'Ristoranti', categoria_id: 1)

    impresa1.sottocategorie << sottocategoria

    impresa1.save()

    impresa= Impresa.new(nome: 'Marmellate spa', telefono: '123460', descrizione: 'Boh', titolare_id: 1, citta_id: citta.id,
    verificato: true, congelato: false, indirizzo: 'piazza Paladini 4', email: 'impre30@sa.it')

    impresa.sottocategorie << sottocategoria

    impresa.valid?

    expect(impresa.errors[:base]).to include("Impresa già presente.")
  end
  it "is invalid without a sottocategoria" do
    citta= Citta.create(nome: "Taormina", provincia: "Messina", regione: "Sicilia", polo_id: 1)

    impresa= Impresa.new(nome: 'Marmellate spa', telefono: '123460', descrizione: 'Boh', titolare_id: 1, citta_id: citta.id,
    verificato: true, congelato: false, indirizzo: 'piazza Paladini 4', email: 'impre30@sa.it')

    expect(impresa).not_to be_valid
  end
  it "is invalid with a not standard email" do
    citta= Citta.create(nome: "Taormina", provincia: "Messina", regione: "Sicilia", polo_id: 1)

    impresa= Impresa.new(nome: 'Marmellate spa', telefono: '123460', descrizione: 'Boh', titolare_id: 1, citta_id: citta.id,
    verificato: true, congelato: false, indirizzo: 'piazza Paladini 4', email: 'boh')

    impresa.sottocategorie << Sottocategoria.create(nome: 'Ristoranti', categoria_id: 1)

    expect(impresa).not_to be_valid
  end

end
