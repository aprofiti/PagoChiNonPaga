require 'rails_helper'

RSpec.describe "ordini/edit", type: :view do
  before(:each) do
    @ordine = assign(:ordine, Ordine.create!(
      :stato => "MyString"
    ))
  end

  it "renders the edit ordine form" do
    render

    assert_select "form[action=?][method=?]", ordine_path(@ordine), "post" do

      assert_select "input#ordine_stato[name=?]", "ordine[stato]"
    end
  end
end
