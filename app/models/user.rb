class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :items

  PASSWORD_REGEX = /\A([0-9].*[a-zA-Z]|[a-zA-Z].*[0-9])\z/.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'は半角英数字混合で設定してください'

  validates :nickname,         presence: true
  validates :born_day,         presence: true

  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'には全角文字を使用してください' } do
  validates :family_name
  validates :first_name
  end

  with_options presence: true, format: { with: /\A[ァ-ヴー]+\z/u, message: 'には全角カタカナを使用してください' } do
  validates :family_name_kana
  validates :first_name_kana
  end
end
