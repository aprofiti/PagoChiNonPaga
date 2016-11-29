require 'rails_helper'

RSpec.describe "indirizzi/edit", type: :view do
  before(:each) do
    @indirizzo = assign(:indirizzo, Indirizzo.create!(
      :via => "MyString",
      :ncivico => 1,
      :cap => "MyString",
      :quartiere => "MyString"
    ))
  end

  it "renders the edit indirizzo form" do
    render

    assert_select "form[action=?][method=?]", indirizzo_path(@indirizzo), "post" do

      assert_select "input#indirizzo_via[name=?]", "indirizzo[via]"

      assert_select "input#indirizzo_ncivico[name=?]", "indirizzo[ncivico]"

      assert_select "input#indirizzo_cap[name=?]", "indirizzo[cap]"

      assert_select "input#indirizzo_quartiere[name=?]", "indirizzo[quartiere]"
    end
  end
end
