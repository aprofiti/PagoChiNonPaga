require 'rails_helper'

RSpec.describe "utenti/show", type: :view do
  before(:each) do
    @utente = assign(:utente, Utente.create!(
      :nome => "Nome",
      :cognome => "Cognome",
      :cf => "Cf",
      :telefono => "Telefono"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Nome/)
    expect(rendered).to match(/Cognome/)
    expect(rendered).to match(/Cf/)
    expect(rendered).to match(/Telefono/)
  end
end
