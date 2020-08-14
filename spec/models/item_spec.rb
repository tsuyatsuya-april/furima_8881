require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
      @item.image = fixture_file_upload('public/images/test_image.png')
    end

    describe '出品商品の登録' do
      context "商品登録ができる場合" do
        it '全ての項目があれば登録できる' do
          expect(@item).to be_valid
        end
      end

      context "商品が登録できない場合" do
        it '出品画像の選択をしていないと登録できない' do
          @item.image = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Image can't be blank")
        end
        it '商品名が空にしていると登録できない' do
          @item.email = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Email can't be blank")
        end
        it '商品名の説明が記載していないと登録できない' do
          @item.save
          @another = FactoryBot.build(:user)
          @another.email = @item.email
          @another.valid?
          expect(@another.errors.full_messages).to include('Email has already been taken')
        end
        it 'カテゴリーを選択していないと登録できない' do
          @item.password = 'aaaa'
          @item.password_confirmation = @item.password
          @item.valid?
          expect(@item.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
        end
        it '商品の状態を選択していないと登録できない' do
          @item.password = 'aaaaaaa'
          @item.password_confirmation = @item.password
          @item.valid?
          expect(@item.errors.full_messages).to include('Password 半角英数字混合のパスワードにしてください')
        end
        it '配送料の負担を選択していないと登録できない' do
          @item.password_confirmation = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Password confirmation doesn't match Password")
        end
        it '発送元の地域を選択していないと登録できない' do
          @item.last_name = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Last name can't be blank")
        end
        it '発送までの日数を選択していないと登録できない' do
          @item.last_name = 'kento4'
          @item.valid?
          expect(@item.errors.full_messages).to include('Last name 全角文字を使用してください')
        end
        it '価格を記載していないと登録できない' do
          @item.first_name = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("First name can't be blank")
        end
        it '価格のテキスト文字が半角数字以外だと登録できない' do
          @item.first_name = 'kento4'
          @item.valid?
          expect(@item.errors.full_messages).to include('First name 全角文字を使用してください')
        end
        it '価格の金額が300円より下なら登録できない' do
          @item.last_kana_name = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Last kana name can't be blank")
        end
        it '価格の金額が9999999以上なら登録できない' do
          @item.last_kana_name = '漢字'
          @item.valid?
          expect(@item.errors.full_messages).to include('Last kana name 全角カタカナを使用してください')
        end
      end

      context "javascriptの動作について" do
        it '価格に対して10%の税金と90%の利益の記載があるか' do
          @item.first_kana_name = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("First kana name can't be blank")
        end
      end
    end
  end
end