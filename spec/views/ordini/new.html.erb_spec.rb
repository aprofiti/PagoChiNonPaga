require 'rails_helper'

RSpec.describe "ordini/new", type: :view do
  before(:each) do
    assign(:ordine, Ordine.new(
      :stato => "MyString"
    ))
  end

  it "renders new ordine form" do
    render

    assert_select "form[action=?][method=?]", ordini_path, "post" do

      assert_select "input#ordine_stato[name=?]", "ordine[stato]"
    end
  end
end
