require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
      @item.image = fixture_file_upload('public/images/test_image.png')
    end

    describe '出品商品の登録' do
      context '商品登録ができる場合' do
        it '全ての項目があれば登録できる' do
          expect(@item).to be_valid
        end
      end

      context '商品が登録できない場合' do
        it '出品画像の選択をしていないと登録できない' do
          @item.image = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Image can't be blank")
        end
        it '商品名を空白にしていると登録できない' do
          @item.name = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Name can't be blank")
        end
        it '商品名の説明が記載していないと登録できない' do
          @item.description = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Description can't be blank")
        end
        it 'カテゴリーを選択していないと登録できない' do
          @item.category_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('Category セレクトボタンにて項目を選択下さい')
        end
        it '商品の状態を選択していないと登録できない' do
          @item.state_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('State セレクトボタンにて項目を選択下さい')
        end
        it '配送料の負担を選択していないと登録できない' do
          @item.pay_state_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('Pay state セレクトボタンにて項目を選択下さい')
        end
        it '発送元の地域を選択していないと登録できない' do
          @item.ship_origin_prefecture_id = 0
          @item.valid?
          expect(@item.errors.full_messages).to include('Ship origin prefecture セレクトボタンにて項目を選択下さい')
        end
        it '発送までの日数を選択していないと登録できない' do
          @item.ship_prepare_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('Ship prepare セレクトボタンにて項目を選択下さい')
        end
        it '価格を記載していないと登録できない' do
          @item.price = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Price can't be blank")
        end
        it '価格のテキスト文字が半角数字以外だと登録できない' do
          @item.price = '五五五五五'
          @item.valid?
          expect(@item.errors.full_messages).to include('Price 半角表記にて、300~9,999,999の範囲を指定下さい。')
        end
        it '価格の金額が300円より下なら登録できない' do
          @item.price = 100
          @item.valid?
          expect(@item.errors.full_messages).to include('Price 半角表記にて、300~9,999,999の範囲を指定下さい。')
        end
        it '価格の金額が9999999以上なら登録できない' do
          @item.price = 10_000_000
          @item.valid?
          expect(@item.errors.full_messages).to include('Price 半角表記にて、300~9,999,999の範囲を指定下さい。')
        end
      end
    end
  end
end
