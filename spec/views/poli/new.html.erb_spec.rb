require 'rails_helper'

RSpec.describe "poli/new", type: :view do
  before(:each) do
    assign(:polo, Polo.new(
      :nome => "MyString"
    ))
  end

  it "renders new polo form" do
    render

    assert_select "form[action=?][method=?]", poli_path, "post" do

      assert_select "input#polo_nome[name=?]", "polo[nome]"
    end
  end
end
