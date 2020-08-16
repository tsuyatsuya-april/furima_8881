class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :items
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # 正規表現の変数
  hankaku_mix = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,100}+\z/i
  zenkaku = /\A[ぁ-んァ-ン一-龥]+\z/
  zenkaku_kana = /\A[ァ-ヶー－]+\z/

  with_options presence: true do
    validates :nickname
    validates :last_name, format: { with: zenkaku, message: '全角文字を使用してください' }
    validates :first_name, format: { with: zenkaku, message: '全角文字を使用してください' }
    validates :last_kana_name, format: { with: zenkaku_kana, message: '全角カタカナを使用してください' }
    validates :first_kana_name, format: { with: zenkaku_kana, message: '全角カタカナを使用してください' }
    validates :birth
  end
  validates :password, format: { with: hankaku_mix, message: '半角英数字混合のパスワードにしてください' }
end
