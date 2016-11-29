require 'rails_helper'

RSpec.describe "ordini/index", type: :view do
  before(:each) do
    assign(:ordini, [
      Ordine.create!(
        :stato => "Stato"
      ),
      Ordine.create!(
        :stato => "Stato"
      )
    ])
  end

  it "renders a list of ordini" do
    render
    assert_select "tr>td", :text => "Stato".to_s, :count => 2
  end
end
