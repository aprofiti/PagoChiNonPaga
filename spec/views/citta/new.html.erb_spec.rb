require 'rails_helper'

RSpec.describe "citta/new", type: :view do
  before(:each) do
    assign(:citta, Citta.new(
      :nome => "MyString",
      :provincia => "MyString",
      :regione => "MyString"
    ))
  end

  it "renders new citta form" do
    render

    assert_select "form[action=?][method=?]", citta_index_path, "post" do

      assert_select "input#citta_nome[name=?]", "citta[nome]"

      assert_select "input#citta_provincia[name=?]", "citta[provincia]"

      assert_select "input#citta_regione[name=?]", "citta[regione]"
    end
  end
end
