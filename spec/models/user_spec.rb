require 'rails_helper'

RSpec.describe User, type: :model do
  user = User.new(email: "cryptracker@email.com", encrypted_password: "password")
    it "should fail without email" do
      user.email = ""
      user.save
      expect(user).to_not be_valid
    end

    it "should fail without password" do
      user.encrypted_password = ""
      user.save
      expect(user).to_not be_valid
    end

    it "should fail if password is below 6 chars" do 
      user.encrypted_password = "a" *5 
      user.save 
      expect(user).to_not be_valid 
    end
end
