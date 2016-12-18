require 'rails_helper'

RSpec.describe "carrello/edit", type: :view do
  before(:each) do
    @carrello = assign(:carrello, Carrello.create!())
  end

  it "renders the edit carrello form" do
    render

    assert_select "form[action=?][method=?]", carrello_path(@carrello), "post" do
    end
  end
end
