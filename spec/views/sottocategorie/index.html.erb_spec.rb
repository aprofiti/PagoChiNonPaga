require 'rails_helper'

RSpec.describe "sottocategorie/index", type: :view do
  before(:each) do
    assign(:sottocategorie, [
      Sottocategoria.create!(
        :nome => "Nome"
      ),
      Sottocategoria.create!(
        :nome => "Nome"
      )
    ])
  end

  it "renders a list of sottocategorie" do
    render
    assert_select "tr>td", :text => "Nome".to_s, :count => 2
  end
end
