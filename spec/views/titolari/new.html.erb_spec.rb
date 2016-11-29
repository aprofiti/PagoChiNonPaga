require 'rails_helper'

RSpec.describe "titolari/new", type: :view do
  before(:each) do
    assign(:titolare, Titolare.new(
      :piva => "MyString"
    ))
  end

  it "renders new titolare form" do
    render

    assert_select "form[action=?][method=?]", titolari_path, "post" do

      assert_select "input#titolare_piva[name=?]", "titolare[piva]"
    end
  end
end
