class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname,            length: { maximum: 40 }
    validates :first_name,          format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/, message: 'Full-width characters' }
    validates :last_name,           format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/, message: 'Full-width characters' }
    validates :first_name_katakana, format: { with: /\A[ァ-ヶ]+\z/, message: 'Full-width katakana characters' }
    validates :last_name_katakana,  format: { with: /\A[ァ-ヶ]+\z/, message: 'Full-width katakana characters' }
    validates :birthday
  end
end
