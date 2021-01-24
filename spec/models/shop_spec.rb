require 'rails_helper'

RSpec.describe Shop, type: :model do
  describe '#create' do
    it "is valid with full params" do
      shop = build(:shop)
      expect(shop).to be_valid
    end

    it "is invalid without a name" do
      shop = build(:shop, name: nil)
      shop.valid?
      expect(shop.errors[:name]).to include("can't be blank")
    end

    it "is invalid without a postal_code" do
      shop = build(:shop, postal_code: nil)
      shop.valid?
      expect(shop.errors[:postal_code]).to include("can't be blank")
    end
    
    it "is invalid without a postal_code" do
      shop = build(:shop, postal_code: nil)
      shop.valid?
      expect(shop.errors[:postal_code]).to include("can't be blank")
    end
  end
end
