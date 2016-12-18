require 'rails_helper'

RSpec.describe "carrello/show", type: :view do
  before(:each) do
    @carrello = assign(:carrello, Carrello.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
