require 'rails_helper'

RSpec.describe BuyerDestination, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @buyer_destination = FactoryBot.build(:buyer_destination, user_id: user.id, item_id: item.id)
  end

  describe '配送先情報の保存' do
    context '配送先情報の保存ができるとき' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@buyer_destination).to be_valid
      end
      it '建物名が空でも保存できる' do
        @buyer_destination.building_name = nil
        expect(@buyer_destination).to be_valid
      end
      it '電話番号が11番桁以内かつハイフンなしであれば保存できる' do
        @buyer_destination.phone_number = 12_345_678_910
        expect(@buyer_destination).to be_valid
      end
    end

    context '配送先情報の保存ができないとき' do
      it 'user_idが空だと保存できない' do
        @buyer_destination.user_id = ''
        @buyer_destination.valid?
        expect(@buyer_destination.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが空だと保存できない' do
        @buyer_destination.item_id = ''
        @buyer_destination.valid?
        expect(@buyer_destination.errors.full_messages).to include("Item can't be blank")
      end
      it '郵便番号が空だと保存できないこと' do
        @buyer_destination.post_code = ''
        @buyer_destination.valid?
        expect(@buyer_destination.errors.full_messages).to include("Post code can't be blank")
      end
      it '郵便番号にハイフンがないと保存できないこと' do
        @buyer_destination.post_code = 1_234_567
        @buyer_destination.valid?
        expect(@buyer_destination.errors.full_messages).to include('Post code is invalid. Include hyphen(-)')
      end
      it 'areaが未選択だとだと保存できないこと' do
        @buyer_destination.area_id = 1
        @buyer_destination.valid?
        expect(@buyer_destination.errors.full_messages).to include("Area can't be blank")
      end
      it '市区町村が空だと保存できないこと' do
        @buyer_destination.city = ''
        @buyer_destination.valid?
        expect(@buyer_destination.errors.full_messages).to include("City can't be blank")
      end
      it '番地が空だと保存できないこと' do
        @buyer_destination.address = ''
        @buyer_destination.valid?
        expect(@buyer_destination.errors.full_messages).to include("Address can't be blank")
      end
      it '電話番号が空だと保存できないこと' do
        @buyer_destination.phone_number = ''
        @buyer_destination.valid?
        expect(@buyer_destination.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号にハイフンがあると保存できないこと' do
        @buyer_destination.phone_number = '123 - 1234 - 1234'
        @buyer_destination.valid?
        expect(@buyer_destination.errors.full_messages).to include('Phone number is invalid')
      end
      it '電話番号が12桁以上あると保存できないこと' do
        @buyer_destination.phone_number = 12_345_678_910_123_111
        @buyer_destination.valid?
        expect(@buyer_destination.errors.full_messages).to include('Phone number is invalid')
      end
      it '電話番号が9桁以下あると保存できないこと' do
        @buyer_destination.phone_number = 12_345_678
        @buyer_destination.valid?
        expect(@buyer_destination.errors.full_messages).to include('Phone number is invalid')
      end
      it 'トークンが空だと保存できないこと' do
        @buyer_destination.token = ''
        @buyer_destination.valid?
        expect(@buyer_destination.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
