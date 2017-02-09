require 'rails_helper'

RSpec.describe Sottocategoria, type: :model do
  it "is invalid without a nome" do
    sottocategoria= Sottocategoria.new(nome:"", categoria_id: 1)
    expect(sottocategoria).not_to be_valid
  end
  it "is invalid without a categoria_id" do
    sottocategoria= Sottocategoria.new(nome:"sottocategoria")
    expect(sottocategoria).not_to be_valid
  end
  it "is invalid if is already in the db" do
    Sottocategoria.create(nome:"sottocategoria", categoria_id: 1)
    sottocategoria= Sottocategoria.new(nome:"sottocategoria", categoria_id: 1)

    sottocategoria.valid?
    expect(sottocategoria.errors[:base]).to include("Sottocategoria già presente.")
  end
end
