require 'rails_helper'

RSpec.describe "poli/edit", type: :view do
  before(:each) do
    @polo = assign(:polo, Polo.create!(
      :nome => "MyString"
    ))
  end

  it "renders the edit polo form" do
    render

    assert_select "form[action=?][method=?]", polo_path(@polo), "post" do

      assert_select "input#polo_nome[name=?]", "polo[nome]"
    end
  end
end
