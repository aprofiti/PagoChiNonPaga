require 'rails_helper'

RSpec.describe "indirizzi/show", type: :view do
  before(:each) do
    @indirizzo = assign(:indirizzo, Indirizzo.create!(
      :via => "Via",
      :ncivico => 2,
      :cap => "Cap",
      :quartiere => "Quartiere"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Via/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Cap/)
    expect(rendered).to match(/Quartiere/)
  end
end
