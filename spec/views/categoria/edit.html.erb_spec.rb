require 'rails_helper'

RSpec.describe "categoria/edit", type: :view do
  before(:each) do
    @categorie = assign(:categorie, Categorie.create!(
      :nome => "MyString"
    ))
  end

  it "renders the edit categorie form" do
    render

    assert_select "form[action=?][method=?]", categorie_path(@categorie), "post" do

      assert_select "input#categorie_nome[name=?]", "categorie[nome]"
    end
  end
end
