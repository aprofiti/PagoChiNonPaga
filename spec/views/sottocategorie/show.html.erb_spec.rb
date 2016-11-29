require 'rails_helper'

RSpec.describe "sottocategorie/show", type: :view do
  before(:each) do
    @sottocategoria = assign(:sottocategoria, Sottocategoria.create!(
      :nome => "Nome"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Nome/)
  end
end
