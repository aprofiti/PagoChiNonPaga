require 'rails_helper'

RSpec.describe "imprese/edit", type: :view do
  before(:each) do
    @impresa = assign(:impresa, Impresa.create!(
      :nome => "MyString",
      :telefono => "MyString",
      :fax => "MyString",
      :giorni_orari => "MyString",
      :email => "MyString",
      :sitoweb => "MyString",
      :facebook => "MyString",
      :descrizione => "MyString",
      :lat => 1.5,
      :lng => 1.5,
      :verificato => false,
      :congelato => false
    ))
  end

  it "renders the edit impresa form" do
    render

    assert_select "form[action=?][method=?]", impresa_path(@impresa), "post" do

      assert_select "input#impresa_nome[name=?]", "impresa[nome]"

      assert_select "input#impresa_telefono[name=?]", "impresa[telefono]"

      assert_select "input#impresa_fax[name=?]", "impresa[fax]"

      assert_select "input#impresa_giorni_orari[name=?]", "impresa[giorni_orari]"

      assert_select "input#impresa_email[name=?]", "impresa[email]"

      assert_select "input#impresa_sitoweb[name=?]", "impresa[sitoweb]"

      assert_select "input#impresa_facebook[name=?]", "impresa[facebook]"

      assert_select "input#impresa_descrizione[name=?]", "impresa[descrizione]"

      assert_select "input#impresa_lat[name=?]", "impresa[lat]"

      assert_select "input#impresa_lng[name=?]", "impresa[lng]"

      assert_select "input#impresa_verificato[name=?]", "impresa[verificato]"

      assert_select "input#impresa_congelato[name=?]", "impresa[congelato]"
    end
  end
end
