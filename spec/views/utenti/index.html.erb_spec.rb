require 'rails_helper'

RSpec.describe "utenti/index", type: :view do
  before(:each) do
    assign(:utenti, [
      Utente.create!(
        :nome => "Nome",
        :cognome => "Cognome",
        :cf => "Cf",
        :telefono => "Telefono"
      ),
      Utente.create!(
        :nome => "Nome",
        :cognome => "Cognome",
        :cf => "Cf",
        :telefono => "Telefono"
      )
    ])
  end

  it "renders a list of utenti" do
    render
    assert_select "tr>td", :text => "Nome".to_s, :count => 2
    assert_select "tr>td", :text => "Cognome".to_s, :count => 2
    assert_select "tr>td", :text => "Cf".to_s, :count => 2
    assert_select "tr>td", :text => "Telefono".to_s, :count => 2
  end
end
