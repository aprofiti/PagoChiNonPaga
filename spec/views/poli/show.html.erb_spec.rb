require 'rails_helper'

RSpec.describe "poli/show", type: :view do
  before(:each) do
    @polo = assign(:polo, Polo.create!(
      :nome => "Nome"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Nome/)
  end
end
