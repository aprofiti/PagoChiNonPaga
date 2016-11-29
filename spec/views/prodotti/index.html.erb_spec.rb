require 'rails_helper'

RSpec.describe "prodotti/index", type: :view do
  before(:each) do
    assign(:prodotti, [
      Prodotto.create!(
        :nome => "Nome",
        :prezzo => 2.5,
        :qta => 3,
        :descrizione => "Descrizione"
      ),
      Prodotto.create!(
        :nome => "Nome",
        :prezzo => 2.5,
        :qta => 3,
        :descrizione => "Descrizione"
      )
    ])
  end

  it "renders a list of prodotti" do
    render
    assert_select "tr>td", :text => "Nome".to_s, :count => 2
    assert_select "tr>td", :text => 2.5.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => "Descrizione".to_s, :count => 2
  end
end
