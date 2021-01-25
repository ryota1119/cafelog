require 'rails_helper'

RSpec.describe Shop, type: :model do
  describe '#create' do
    it "is valid with full params." do
      shop = build(:shop)
      expect(shop).to be_valid
    end

    it "is invalid without a name." do
      shop = build(:shop, name: nil)
      shop.valid?
      expect(shop.errors[:name]).to include("can't be blank")
    end

    it "is invalid without a postal_code." do
      shop = build(:shop, postal_code: nil)
      shop.valid?
      expect(shop.errors[:postal_code]).to include("can't be blank")
    end

    it "is invalid if the postal_code does not contain any non-numeric characters." do
      shop = build(:shop, postal_code: "ttttttt")
      shop.valid?
      expect(shop.errors[:postal_code]).to include("6桁の半角英数字を入力してください。")
    end

    it "is invalid without a prefecture." do
      shop = build(:shop, prefecture: nil)
      shop.valid?
      expect(shop.errors[:prefecture]).to include("can't be blank")
    end

    it "is invalid without a city." do
      shop = build(:shop, city: nil)
      shop.valid?
      expect(shop.errors[:city]).to include("can't be blank")
    end

    it "is invalid without a phone_number." do
      shop = build(:shop, phone_number: nil)
      shop.valid?
      expect(shop.errors[:phone_number]).to include("can't be blank")
    end

    it "is invalid if the phone_number does contain any non-numeric characters." do
      shop = build(:shop, phone_number: "ttttttttttt")
      shop.valid?
      expect(shop.errors[:phone_number]).to include("10桁または11桁の半角英数字を入力してください。")
    end

    it "is invalid if the phone_number is less than 9 characters." do
      shop = build(:shop, phone_number: "000000000")
      shop.valid?
      expect(shop.errors[:phone_number]).to include("10桁または11桁の半角英数字を入力してください。")
    end

    it "is invalid if the phone_number is more than 12 characters." do
      shop = build(:shop, phone_number: "000000000000")
      shop.valid?
      expect(shop.errors[:phone_number]).to include("10桁または11桁の半角英数字を入力してください。")
    end

  end
end
