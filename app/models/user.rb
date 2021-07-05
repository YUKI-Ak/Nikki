class User < ApplicationRecord
  has_many :articles, dependent: :destroy
  has_many :comments, dependent: :destroy
  belongs_to :profile

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname

    valid_password_regex = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
    validates :password,
              format: { with: valid_password_regex,
              message: "は半角英数字それぞれ１文字以上含む必要があります" },
              length: { minimum: 6, maximum: 15 }
    validates :birthday
    validates :password_confirmation
  end

  valid_username_regex = /\A[ぁ-ゔァ-ヴ\p{Ideographic}ａ-ｚＡ-Ｚ０-９]+\z/.freeze
  with_options presence: true, format: { with: valid_username_regex, message: 'に全角文字を使用してください' } do
    validates :last_name
    validates :first_name
  end

  valid_username_kana_regex = /\A[ァ-ヶー－]+\z/.freeze
  with_options presence: true, format: { with: valid_username_kana_regex, message: 'に全角カタカナ文字を使用してください' } do
    validates :lname_kana
    validates :fname_kana
  end
end
