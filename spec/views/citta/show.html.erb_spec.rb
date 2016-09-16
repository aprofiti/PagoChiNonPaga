require 'rails_helper'

RSpec.describe "citta/show", type: :view do
  before(:each) do
    @citta = assign(:citta, Citta.create!(
      :nome => "Nome",
      :provincia => "Provincia",
      :regione => "Regione"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Nome/)
    expect(rendered).to match(/Provincia/)
    expect(rendered).to match(/Regione/)
  end
end
