require 'rails_helper'

RSpec.describe Owner, type: :model do
  describe '#create' do
    it "is valid with a name, email and password" do
      owner = build(:owner)
      expect(owner).to be_valid
    end

    it "is invalid without a name." do
      owner = build(:owner, name: nil)
      owner.valid?
      expect(owner.errors[:name]).to include("can't be blank")
    end

    it "is invalid without a email." do
      owner = build(:owner, email: nil)
      owner.valid?
      expect(owner.errors[:email]).to include("can't be blank")
    end

    it "is invalid without a password." do
      owner = build(:owner, password: nil)
      owner.valid?
      expect(owner.errors[:password]).to include("can't be blank")
    end

    it "is invalid duplicate emails if they exist." do
      owner1 = create(:owner, email: "testman@test.com")
      owner2 = build(:owner, email: "testman@test.com")
      owner2.valid?
      expect(owner2.errors[:email]).to include("has already been taken")
    end
    
    # it "is invalid if there is no password_confirmation even if the password exists." do
    #   owner = build(:owner, password_confirmation: nil)
    #   owner.valid?
    #   expect(owner.errors[:password_confirmation]).to include("")
    # end

    it "is valid if the password is at least 6 characters." do
      owner = build(:owner, password: "123456", password_confirmation: "123456")
      expect(owner).to be_valid
    end

    it "is invalid if the password is less than 5 characters." do
      owner = build(:owner, password: "12345", password_confirmation: "12345")
      owner.valid?
      expect(owner.errors[:password]).to include("is too short (minimum is 6 characters)")
    end
  end
end