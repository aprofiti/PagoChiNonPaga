require 'rails_helper'

RSpec.describe Polo, type: :model do
  it "is invalid without a nome" do
    polo= Polo.new(nome:"",email:"boh@boh.it")
    expect(polo).not_to be_valid
  end
  it "is invalid with a nome with special characters" do
    polo= Polo.new(nome:"Ap Me?",email:"boh@boh.it")
    expect(polo).not_to be_valid
  end
  it "is invalid with wrong email" do
    polo= Polo.new(nome:"Ap Me?",email:"boh")
    expect(polo).not_to be_valid
  end
end
