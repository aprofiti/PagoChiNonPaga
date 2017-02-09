require 'rails_helper'

RSpec.describe StatoOrdine, type: :model do
  it "is invalid without a stato" do
    stato= StatoOrdine.new(stato:"")
    expect(stato).not_to be_valid
  end
  it "is invalid if is already in the db" do
    StatoOrdine.create(stato:"stato")
    stato= StatoOrdine.new(stato:"stato")

    stato.valid?
    expect(stato.errors[:base]).to include("Stato già presente.")
  end
end
