require 'rails_helper'

RSpec.describe Categoria, type: :model do
  it "is invalid without a nome" do
    categoria= Categoria.new(nome:"")
    expect(categoria).not_to be_valid
  end
  it "is invalid if is already in the db (not case sensitive)" do
    Categoria.create(nome: "Universita")
    categoria= Categoria.new(nome:"univeRsitA")
    categoria.valid?
    expect(categoria.errors[:base]).to include('Categoria già presente.')
  end
end
