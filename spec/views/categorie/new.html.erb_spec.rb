require 'rails_helper'

RSpec.describe "categorie/new", type: :view do
  before(:each) do
    assign(:categoria, Categoria.new(
      :nome => "MyString"
    ))
  end

  it "renders new categoria form" do
    render

    assert_select "form[action=?][method=?]", categorie_path, "post" do

      assert_select "input#categoria_nome[name=?]", "categoria[nome]"
    end
  end
end
