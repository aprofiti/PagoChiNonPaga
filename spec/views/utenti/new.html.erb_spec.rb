require 'rails_helper'

RSpec.describe "utenti/new", type: :view do
  before(:each) do
    assign(:utente, Utente.new(
      :nome => "MyString",
      :cognome => "MyString",
      :cf => "MyString",
      :telefono => "MyString"
    ))
  end

  it "renders new utente form" do
    render

    assert_select "form[action=?][method=?]", utenti_path, "post" do

      assert_select "input#utente_nome[name=?]", "utente[nome]"

      assert_select "input#utente_cognome[name=?]", "utente[cognome]"

      assert_select "input#utente_cf[name=?]", "utente[cf]"

      assert_select "input#utente_telefono[name=?]", "utente[telefono]"
    end
  end
end
