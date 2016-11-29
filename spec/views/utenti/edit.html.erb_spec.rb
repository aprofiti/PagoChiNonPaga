require 'rails_helper'

RSpec.describe "utenti/edit", type: :view do
  before(:each) do
    @utente = assign(:utente, Utente.create!(
      :nome => "MyString",
      :cognome => "MyString",
      :cf => "MyString",
      :telefono => "MyString"
    ))
  end

  it "renders the edit utente form" do
    render

    assert_select "form[action=?][method=?]", utente_path(@utente), "post" do

      assert_select "input#utente_nome[name=?]", "utente[nome]"

      assert_select "input#utente_cognome[name=?]", "utente[cognome]"

      assert_select "input#utente_cf[name=?]", "utente[cf]"

      assert_select "input#utente_telefono[name=?]", "utente[telefono]"
    end
  end
end
