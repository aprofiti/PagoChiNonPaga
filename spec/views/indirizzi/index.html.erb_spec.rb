require 'rails_helper'

RSpec.describe "indirizzi/index", type: :view do
  before(:each) do
    assign(:indirizzi, [
      Indirizzo.create!(
        :via => "Via",
        :ncivico => 2,
        :cap => "Cap",
        :quartiere => "Quartiere"
      ),
      Indirizzo.create!(
        :via => "Via",
        :ncivico => 2,
        :cap => "Cap",
        :quartiere => "Quartiere"
      )
    ])
  end

  it "renders a list of indirizzi" do
    render
    assert_select "tr>td", :text => "Via".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Cap".to_s, :count => 2
    assert_select "tr>td", :text => "Quartiere".to_s, :count => 2
  end
end
