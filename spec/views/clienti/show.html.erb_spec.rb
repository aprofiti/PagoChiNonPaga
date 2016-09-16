require 'rails_helper'

RSpec.describe "clienti/show", type: :view do
  before(:each) do
    @cliente = assign(:cliente, Cliente.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
