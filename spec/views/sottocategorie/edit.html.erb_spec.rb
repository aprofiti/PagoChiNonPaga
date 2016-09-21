require 'rails_helper'

RSpec.describe "sottocategorie/edit", type: :view do
  before(:each) do
    @sottocategoria = assign(:sottocategoria, Sottocategoria.create!(
      :nome => "MyString"
    ))
  end

  it "renders the edit sottocategoria form" do
    render

    assert_select "form[action=?][method=?]", sottocategoria_path(@sottocategoria), "post" do

      assert_select "input#sottocategoria_nome[name=?]", "sottocategoria[nome]"
    end
  end
end
