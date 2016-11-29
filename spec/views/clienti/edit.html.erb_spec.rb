require 'rails_helper'

RSpec.describe "clienti/edit", type: :view do
  before(:each) do
    @cliente = assign(:cliente, Cliente.create!())
  end

  it "renders the edit cliente form" do
    render

    assert_select "form[action=?][method=?]", cliente_path(@cliente), "post" do
    end
  end
end
