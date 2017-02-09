require 'rails_helper'

RSpec.describe Admin, type: :model do
  it "is invalid without email" do
    admin= Admin.new(email:"",polo_id:1,password:"123456",password_confirmation:"123456")
    expect(admin).not_to be_valid
  end
  it "is invalid without password" do
    admin= Admin.new(email:"ciao@ciao.it",polo_id: 1,password:"",password_confirmation:"")
    expect(admin).not_to be_valid
  end
  it "is invalid if is already in the db" do
    Admin.create(email:"ciao@ciao.it",polo_id:2,password:"123456",password_confirmation:"123456")
    admin= Admin.new(email:"ciao@ciao.it",polo_id:1,password:"123456",password_confirmation:"123456")
    admin.valid?
    expect(admin.errors[:base]).to include('Email già utilizzata.')
  end
end
