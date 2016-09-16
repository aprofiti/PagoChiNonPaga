require 'rails_helper'

RSpec.describe "ordini/show", type: :view do
  before(:each) do
    @ordine = assign(:ordine, Ordine.create!(
      :stato => "Stato"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Stato/)
  end
end
