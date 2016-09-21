require 'rails_helper'

RSpec.describe "categorie/index", type: :view do
  before(:each) do
    assign(:categorie, [
      Categoria.create!(
        :nome => "Nome"
      ),
      Categoria.create!(
        :nome => "Nome"
      )
    ])
  end

  it "renders a list of categorie" do
    render
    assert_select "tr>td", :text => "Nome".to_s, :count => 2
  end
end
