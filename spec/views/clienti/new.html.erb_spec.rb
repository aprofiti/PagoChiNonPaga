require 'rails_helper'

RSpec.describe "clienti/new", type: :view do
  before(:each) do
    assign(:cliente, Cliente.new())
  end

  it "renders new cliente form" do
    render

    assert_select "form[action=?][method=?]", clienti_path, "post" do
    end
  end
end
