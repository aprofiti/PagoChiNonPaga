require 'rails_helper'

RSpec.describe "sottocategorie/new", type: :view do
  before(:each) do
    assign(:sottocategoria, Sottocategoria.new(
      :nome => "MyString"
    ))
  end

  it "renders new sottocategoria form" do
    render

    assert_select "form[action=?][method=?]", sottocategorie_path, "post" do

      assert_select "input#sottocategoria_nome[name=?]", "sottocategoria[nome]"
    end
  end
end
