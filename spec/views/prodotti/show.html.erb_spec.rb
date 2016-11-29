require 'rails_helper'

RSpec.describe "prodotti/show", type: :view do
  before(:each) do
    @prodotto = assign(:prodotto, Prodotto.create!(
      :nome => "Nome",
      :prezzo => 2.5,
      :qta => 3,
      :descrizione => "Descrizione"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Nome/)
    expect(rendered).to match(/2.5/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/Descrizione/)
  end
end
