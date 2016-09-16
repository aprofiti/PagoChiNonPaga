require 'rails_helper'

RSpec.describe "titolari/edit", type: :view do
  before(:each) do
    @titolare = assign(:titolare, Titolare.create!(
      :piva => "MyString"
    ))
  end

  it "renders the edit titolare form" do
    render

    assert_select "form[action=?][method=?]", titolare_path(@titolare), "post" do

      assert_select "input#titolare_piva[name=?]", "titolare[piva]"
    end
  end
end
