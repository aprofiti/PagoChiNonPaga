require 'rails_helper'

RSpec.describe "sottocategoria/show", type: :view do
  before(:each) do
    @sottocategorie = assign(:sottocategorie, Sottocategorie.create!(
      :nome => "Nome"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Nome/)
  end
end
