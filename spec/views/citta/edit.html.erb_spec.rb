require 'rails_helper'

RSpec.describe "citta/edit", type: :view do
  before(:each) do
    @citta = assign(:citta, Citta.create!(
      :nome => "MyString",
      :provincia => "MyString",
      :regione => "MyString"
    ))
  end

  it "renders the edit citta form" do
    render

    assert_select "form[action=?][method=?]", citta_path(@citta), "post" do

      assert_select "input#citta_nome[name=?]", "citta[nome]"

      assert_select "input#citta_provincia[name=?]", "citta[provincia]"

      assert_select "input#citta_regione[name=?]", "citta[regione]"
    end
  end
end
