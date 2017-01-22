require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

RSpec.describe OrdiniController, type: :controller do
  before :each do
    @cliente= createCliente("Mario","Rossi")
    @titolare = createTitolare("Romeo","Bianchi")
    citta= Citta.create(nome: "Roma", provincia: "Rm", regione: "Lazio",polo_id: 1)
    @impresa = createImpresa("impresa","imp@resa.com",citta,@titolare,false)
    @prodotto = Prodotto.create(nome: "prodotto",qta: 10, prezzo: 10, impresa_id: @impresa.id,descrizione: "descrizioneee")
    @stato = StatoOrdine.create(stato: "In attesa")
  end

  it "should get ordine" do
    prodotti = [@prodotto]
    ordine= Ordine.create(cliente_id: @cliente.id, impresa_id: @impresa.id, stato_ordine_id: @stato.id,prodotti: prodotti)
    sign_in @cliente
    get :show , id: ordine.id
    expect(response).to render_template :show
  end

  it "should not get ordine" do
    prodotti = [@prodotto]
    ordine= Ordine.create(cliente_id: @cliente.id, impresa_id: @impresa.id, stato_ordine_id: @stato.id,prodotti: prodotti)
    get :show , id: ordine.id
    expect(response).to_not render_template :show
  end

  it "should not get edit ordine to cliente" do
    prodotti = [@prodotto]
    ordine= Ordine.create(cliente_id: @cliente.id, impresa_id: @impresa.id, stato_ordine_id: @stato.id,prodotti: prodotti)
    sign_in @cliente
    get :edit , id: ordine.id
    expect(response).to_not render_template :edit
  end
=begin
  it "should get edit ordine to titolare" do
    prodotti = [@prodotto]
    ordine= Ordine.create(cliente_id: @cliente.id, impresa_id: @impresa.id, stato_ordine_id: @stato.id,prodotti: prodotti)
    sign_in @titolare
    get :edit , id: ordine.id
    expect(response).to render_template :edit
  end
=end
  it "should destroy order" do
    prodotti = [@prodotto]
    ordine= Ordine.create(cliente_id: @cliente.id, impresa_id: @impresa.id, stato_ordine_id: @stato.id,prodotti: prodotti)
    sign_in @cliente
    put :destroy, id: ordine.id
    expect(Ordine.count).to eq(0)
  end

  it "should destroy order" do
    prodotti = [@prodotto]
    stato2 = StatoOrdine.create(stato: "Pagato")
    ordine= Ordine.create(cliente_id: @cliente.id, impresa_id: @impresa.id, stato_ordine_id: stato2.id,prodotti: prodotti)
    sign_in @cliente
    put :destroy, id: ordine.id
    expect(Ordine.count).to eq(1)
  end

end
