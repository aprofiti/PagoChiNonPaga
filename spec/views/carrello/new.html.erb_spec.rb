require 'rails_helper'

RSpec.describe "carrello/new", type: :view do
  before(:each) do
    assign(:carrello, Carrello.new())
  end

  it "renders new carrello form" do
    render

    assert_select "form[action=?][method=?]", carrello_index_path, "post" do
    end
  end
end
