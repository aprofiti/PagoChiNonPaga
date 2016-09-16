require 'rails_helper'

RSpec.describe "citta/index", type: :view do
  before(:each) do
    assign(:citta, [
      Citta.create!(
        :nome => "Nome",
        :provincia => "Provincia",
        :regione => "Regione"
      ),
      Citta.create!(
        :nome => "Nome",
        :provincia => "Provincia",
        :regione => "Regione"
      )
    ])
  end

  it "renders a list of citta" do
    render
    assert_select "tr>td", :text => "Nome".to_s, :count => 2
    assert_select "tr>td", :text => "Provincia".to_s, :count => 2
    assert_select "tr>td", :text => "Regione".to_s, :count => 2
  end
end
