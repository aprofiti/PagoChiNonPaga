require 'rails_helper'

RSpec.describe "sottocategoria/edit", type: :view do
  before(:each) do
    @sottocategorie = assign(:sottocategorie, Sottocategorie.create!(
      :nome => "MyString"
    ))
  end

  it "renders the edit sottocategorie form" do
    render

    assert_select "form[action=?][method=?]", sottocategorie_path(@sottocategorie), "post" do

      assert_select "input#sottocategorie_nome[name=?]", "sottocategorie[nome]"
    end
  end
end
