require 'rails_helper'

RSpec.describe "sottocategoria/index", type: :view do
  before(:each) do
    assign(:sottocategoria, [
      Sottocategorie.create!(
        :nome => "Nome"
      ),
      Sottocategorie.create!(
        :nome => "Nome"
      )
    ])
  end

  it "renders a list of sottocategoria" do
    render
    assert_select "tr>td", :text => "Nome".to_s, :count => 2
  end
end
