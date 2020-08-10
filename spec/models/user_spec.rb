require 'rails_helper'

RSpec.describe User, type: :model do
  describe User, type: :model do
    before do
      @user = FactoryBot.build(:user)
    end
    describe 'ユーザー新規登録' do
      it '全ての項目があれば登録できる' do
        expect(@user).to be_valid
      end
      it 'ニックネームが空だと登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'メールアドレスが空だと登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'メールアドレスが重複していると登録できない' do
        @user.save
        @another = FactoryBot.build(:user)
        @another.email = @user.email
        @another.valid?
        expect(@another.errors.full_messages).to include('Email has already been taken')
      end
      it 'パスワードが６文字より少ないと登録できない' do
        @user.password = 'aaaa'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'パスワードが半角英数字混合ではない場合登録できない' do
        @user.password = 'aaaaaaa'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('Password 半角英数字混合のパスワードにしてください')
      end
      it '確認用パスワードがパスワードと異なっていれば登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'ユーザーの姓名が空白だと登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it 'ユーザーの姓名が半角英数字だと登録できない' do
        @user.last_name = 'kento4'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name 全角文字を使用してください')
      end
      it 'ユーザーの名前が空白だと登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it 'ユーザーの名前が半角英数字だと登録できない' do
        @user.first_name = 'kento4'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name 全角文字を使用してください')
      end
      it 'ユーザーの姓名（カナ）が空白だと登録できない' do
        @user.last_kana_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last kana name can't be blank")
      end
      it 'ユーザーの姓名(カナ)が全角カナ以外だと登録できない' do
        @user.last_kana_name = '漢字'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last kana name 全角カタカナを使用してください')
      end
      it 'ユーザーの名前（カナ）が空白だと登録できない' do
        @user.first_kana_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First kana name can't be blank")
      end
      it 'ユーザーの名前(カナ)が全角カナ以外だと登録できない' do
        @user.first_kana_name = '漢字'
        @user.valid?
        expect(@user.errors.full_messages).to include('First kana name 全角カタカナを使用してください')
      end
      it 'ユーザーの生年月日が空白だと登録できない' do
        @user.birth = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth can't be blank")
      end
    end
  end
end
