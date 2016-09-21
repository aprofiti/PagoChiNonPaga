require 'rails_helper'

RSpec.describe "poli/index", type: :view do
  before(:each) do
    assign(:poli, [
      Polo.create!(
        :nome => "Nome"
      ),
      Polo.create!(
        :nome => "Nome"
      )
    ])
  end

  it "renders a list of poli" do
    render
    assert_select "tr>td", :text => "Nome".to_s, :count => 2
  end
end
