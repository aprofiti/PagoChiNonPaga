require 'rails_helper'

RSpec.describe "titolari/index", type: :view do
  before(:each) do
    assign(:titolari, [
      Titolare.create!(
        :piva => "Piva"
      ),
      Titolare.create!(
        :piva => "Piva"
      )
    ])
  end

  it "renders a list of titolari" do
    render
    assert_select "tr>td", :text => "Piva".to_s, :count => 2
  end
end
