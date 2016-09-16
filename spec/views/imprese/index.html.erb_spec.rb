require 'rails_helper'

RSpec.describe "imprese/index", type: :view do
  before(:each) do
    assign(:imprese, [
      Impresa.create!(
        :nome => "Nome",
        :telefono => "Telefono",
        :fax => "Fax",
        :giorni_orari => "Giorni Orari",
        :email => "Email",
        :sitoweb => "Sitoweb",
        :facebook => "Facebook",
        :descrizione => "Descrizione",
        :lat => 2.5,
        :lng => 3.5,
        :verificato => false,
        :congelato => false
      ),
      Impresa.create!(
        :nome => "Nome",
        :telefono => "Telefono",
        :fax => "Fax",
        :giorni_orari => "Giorni Orari",
        :email => "Email",
        :sitoweb => "Sitoweb",
        :facebook => "Facebook",
        :descrizione => "Descrizione",
        :lat => 2.5,
        :lng => 3.5,
        :verificato => false,
        :congelato => false
      )
    ])
  end

  it "renders a list of imprese" do
    render
    assert_select "tr>td", :text => "Nome".to_s, :count => 2
    assert_select "tr>td", :text => "Telefono".to_s, :count => 2
    assert_select "tr>td", :text => "Fax".to_s, :count => 2
    assert_select "tr>td", :text => "Giorni Orari".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Sitoweb".to_s, :count => 2
    assert_select "tr>td", :text => "Facebook".to_s, :count => 2
    assert_select "tr>td", :text => "Descrizione".to_s, :count => 2
    assert_select "tr>td", :text => 2.5.to_s, :count => 2
    assert_select "tr>td", :text => 3.5.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
