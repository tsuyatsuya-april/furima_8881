require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  describe '住所の保存' do
    before do
      @purchase_address = FactoryBot.build(:purchase_address)
    end

    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@purchase_address).to be_valid
    end

    it '郵便番号が空だと保存できないこと' do
      @purchase_address.postalcode = nil
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Postalcode can't be blank")
    end

    it '郵便番号が半角数字３つハイフン半角数字４の形式でない場合保存できない' do
      @purchase_address.postalcode = '４５６ー３３３３'
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include('Postalcode is invalid. Include hyphen(-)')
    end
    it '都道府県の番号が0（=項目未選択）の場合は保存できない' do
      @purchase_address.prefecture_id = 0
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include('Prefecture select')
    end

    it '市町村の項目が空白の場合は保存ができない' do
      @purchase_address.city = nil
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("City can't be blank")
    end

    it '番地が空白の場合は保存できない' do
      @purchase_address.street = nil
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Street can't be blank")
    end

    it '建物が空白の場合、保存できる' do
      @purchase_address.building = nil
      expect(@purchase_address).to be_valid
    end

    it '電話番号が空白だと保存できない' do
      @purchase_address.phone_number = nil
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Phone number can't be blank")
    end

    it '電話番号が半角数字以外だと保存できない' do
      @purchase_address.phone_number = '０９０９６２３４４１９'
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include('Phone number is invalid. Please only half size number')
    end
  end
end
