require 'rails_helper'

RSpec.describe "clienti/index", type: :view do
  before(:each) do
    assign(:clienti, [
      Cliente.create!(),
      Cliente.create!()
    ])
  end

  it "renders a list of clienti" do
    render
  end
end
