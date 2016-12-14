require 'rails_helper'

RSpec.describe "carrello/index", type: :view do
  before(:each) do
    assign(:carrello, [
      Carrello.create!(),
      Carrello.create!()
    ])
  end

  it "renders a list of carrello" do
    render
  end
end
