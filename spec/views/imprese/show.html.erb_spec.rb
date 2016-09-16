require 'rails_helper'

RSpec.describe "imprese/show", type: :view do
  before(:each) do
    @impresa = assign(:impresa, Impresa.create!(
      :nome => "Nome",
      :telefono => "Telefono",
      :fax => "Fax",
      :giorni_orari => "Giorni Orari",
      :email => "Email",
      :sitoweb => "Sitoweb",
      :facebook => "Facebook",
      :descrizione => "Descrizione",
      :lat => 2.5,
      :lng => 3.5,
      :verificato => false,
      :congelato => false
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Nome/)
    expect(rendered).to match(/Telefono/)
    expect(rendered).to match(/Fax/)
    expect(rendered).to match(/Giorni Orari/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/Sitoweb/)
    expect(rendered).to match(/Facebook/)
    expect(rendered).to match(/Descrizione/)
    expect(rendered).to match(/2.5/)
    expect(rendered).to match(/3.5/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/false/)
  end
end
