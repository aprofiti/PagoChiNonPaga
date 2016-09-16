require 'rails_helper'

RSpec.describe "sottocategoria/new", type: :view do
  before(:each) do
    assign(:sottocategorie, Sottocategorie.new(
      :nome => "MyString"
    ))
  end

  it "renders new sottocategorie form" do
    render

    assert_select "form[action=?][method=?]", sottocategoria_path, "post" do

      assert_select "input#sottocategorie_nome[name=?]", "sottocategorie[nome]"
    end
  end
end
