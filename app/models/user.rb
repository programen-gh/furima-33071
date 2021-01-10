class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname,            length: { maximum: 40 }
    validates :first_name,          format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/, message: 'は全角文字で入力してください' }
    validates :last_name,           format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/, message: 'は全角文字で入力してください' }
    validates :first_name_katakana, format: { with: /\A[ァ-ヶ]+\z/, message: 'は全角カナ文字で入力してください' }
    validates :last_name_katakana,  format: { with: /\A[ァ-ヶ]+\z/, message: 'は全角カナ文字で入力してください' }
    validates :birthday
  end

  has_many :items
  has_many :orders
end
