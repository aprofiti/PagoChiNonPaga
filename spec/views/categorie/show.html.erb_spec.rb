require 'rails_helper'

RSpec.describe "categorie/show", type: :view do
  before(:each) do
    @categoria = assign(:categoria, Categoria.create!(
      :nome => "Nome"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Nome/)
  end
end
