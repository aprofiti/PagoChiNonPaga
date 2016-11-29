require 'rails_helper'

RSpec.describe "indirizzi/new", type: :view do
  before(:each) do
    assign(:indirizzo, Indirizzo.new(
      :via => "MyString",
      :ncivico => 1,
      :cap => "MyString",
      :quartiere => "MyString"
    ))
  end

  it "renders new indirizzo form" do
    render

    assert_select "form[action=?][method=?]", indirizzi_path, "post" do

      assert_select "input#indirizzo_via[name=?]", "indirizzo[via]"

      assert_select "input#indirizzo_ncivico[name=?]", "indirizzo[ncivico]"

      assert_select "input#indirizzo_cap[name=?]", "indirizzo[cap]"

      assert_select "input#indirizzo_quartiere[name=?]", "indirizzo[quartiere]"
    end
  end
end
