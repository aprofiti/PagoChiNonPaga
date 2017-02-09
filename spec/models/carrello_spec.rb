require 'rails_helper'

RSpec.describe Carrello, type: :model do
  it "is invalid without a cliente_id" do
    carrello= Carrello.new()
    expect(carrello).not_to be_valid
  end
end
