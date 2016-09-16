require 'rails_helper'

RSpec.describe "titolari/show", type: :view do
  before(:each) do
    @titolare = assign(:titolare, Titolare.create!(
      :piva => "Piva"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Piva/)
  end
end
