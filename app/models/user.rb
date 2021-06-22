class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true

  #正規表現と一致しているかのバリデーション
  PASSWORD_STATUS = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_STATUS, message: 'には英字と数字の両方を含めて設定してください'

 
  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/, message: '全角（漢字・ひらがな・カタカナ）文字を使用してください'} do
    validates :first_name
    validates :last_name
  end

  with_options presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: '全角（カタカナ）文字を使用してください'} do
    validates :first_name_kana
    validates :last_name_kana
  end
  #ここまで

  validates :birthday, presence: true

  # has_many :items
  # has_many :orders
  # has_many :card #dependent: :destroy(後で実装)

end
