require 'rails_helper'

RSpec.describe "categoria/show", type: :view do
  before(:each) do
    @categorie = assign(:categorie, Categorie.create!(
      :nome => "Nome"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Nome/)
  end
end
