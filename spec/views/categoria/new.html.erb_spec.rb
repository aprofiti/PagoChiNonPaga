require 'rails_helper'

RSpec.describe "categoria/new", type: :view do
  before(:each) do
    assign(:categorie, Categorie.new(
      :nome => "MyString"
    ))
  end

  it "renders new categorie form" do
    render

    assert_select "form[action=?][method=?]", categoria_path, "post" do

      assert_select "input#categorie_nome[name=?]", "categorie[nome]"
    end
  end
end
