require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    it "is valid with full parameter" do
      user = build(:user)
      expect(user).to be_valid
    end

    it "is invalid without a nickname" do
      user = build(:user, nickname: nil)
      user.valid?
      expect(user.errors[:nickname]).to include("can't be blank")
    end

    it "is invalid without a email." do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end

    it "is invalid without a password." do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
    end

    it "is invalid duplicate emails if they exist." do
      user1 = create(:user, email: "testman@test.com")
      user2 = build(:user, email: "testman@test.com")
      user2.valid?
      expect(user2.errors[:email]).to include("has already been taken")
    end

    it "is valid if the password is at least 6 characters." do
      user = build(:user, password: "123456", password_confirmation: "123456")
      expect(user).to be_valid
    end

    it "is invalid if the password is less than 5 characters." do
      user = build(:user, password: "12345", password_confirmation: "12345")
      user.valid?
      expect(user.errors[:password]).to include("is too short (minimum is 6 characters)")
    end
  end
end
