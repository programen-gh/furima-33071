require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    @order_address = FactoryBot.build(:order_address)
  end

  describe '商品購入機能' do
    context '購入ができるとき' do
      it '全ての項目が正しく入力されている' do
        expect(@order_address).to be_valid
      end
      it 'building_name以外が正しく入力されている' do
        @order_address.building_name = ""
        expect(@order_address).to be_valid
      end
    end

    context '購入ができないとき' do
      it 'tokenが空' do
        @order_address.token = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
      it 'postal_codeが空' do
        @order_address.postal_code = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeにハイフンが存在しない' do
        @order_address.postal_code = "1234567"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code Input correctly")
      end
      it 'postal_codeのハイフンの位置が正しくない' do
        @order_address.postal_code = "1234-567"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code Input correctly")
      end
      it 'postal_codeが全角数字' do
        @order_address.postal_code = "１２３-４５６７"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code Input correctly")
      end
      it 'prefecture_idが空（1を選択）' do
        @order_address.prefecture_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture Select")
      end
      it 'municipalityが空' do
        @order_address.municipality = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Municipality can't be blank")
      end
      it 'house_numberが空' do
        @order_address.house_number = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("House number can't be blank")
      end
      it 'phone_numberが空' do
        @order_address.phone_number = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが12桁以上' do
        @order_address.phone_number = "000000000000"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number Input correctly")
      end
      it 'phone_numberにハイフンが存在する' do
        @order_address.phone_number = "090-1234567"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number Input correctly")
      end
      it 'phone_numberが全角数字' do
        @order_address.phone_number = "０００００００００００"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number Input correctly")
      end
    end
  end
end
