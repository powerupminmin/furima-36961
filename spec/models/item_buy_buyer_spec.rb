require 'rails_helper'

RSpec.describe ItemBuyBuyer, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @item_buy_buyer = FactoryBot.build(:item_buy_buyer, user_id: @user.id, item_id: @item.id)
    sleep 0.1
  end

  describe '商品購入' do
    context '商品が購入できる場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@item_buy_buyer).to be_valid
      end
      it 'building_nameは空でも保存できること' do
        @item_buy_buyer.building_name = ''
        expect(@item_buy_buyer).to be_valid
      end
    end

    context '商品が出品できない場合' do
      it '郵便番号がないと保存できない' do
        @item_buy_buyer.post_code = ''
        @item_buy_buyer.valid?
        expect(@item_buy_buyer.errors.full_messages).to include("Post code can't be blank")
      end
      it '都道府県がないと保存できない' do
        @item_buy_buyer.area_id = 1
        @item_buy_buyer.valid?
        expect(@item_buy_buyer.errors.full_messages).to include("Area can't be blank")
      end
      it '市区町村がないと保存できない' do
        @item_buy_buyer.city = ''
        @item_buy_buyer.valid?
        expect(@item_buy_buyer.errors.full_messages).to include("City can't be blank")
      end
      it '番地がないと保存できない' do
        @item_buy_buyer.address = ''
        @item_buy_buyer.valid?
        expect(@item_buy_buyer.errors.full_messages).to include("Address can't be blank")
      end
      it '電話番号がないと保存できない' do
        @item_buy_buyer.phone_number = ''
        @item_buy_buyer.valid?
        expect(@item_buy_buyer.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号は11桁を超えると購入できない' do
        @item_buy_buyer.phone_number = '111111111111'
        @item_buy_buyer.valid?
        expect(@item_buy_buyer.errors.full_messages).to include("Phone number is invalid")
      end
      it '電話番号に数字以外が混じっていると購入できない' do
        @item_buy_buyer.phone_number = '111a111i11'
        @item_buy_buyer.valid?
        expect(@item_buy_buyer.errors.full_messages).to include("Phone number is invalid")
      end
      it 'トークンがないと保存できない' do
        @item_buy_buyer.token = nil
        @item_buy_buyer.valid?
        expect(@item_buy_buyer.errors.full_messages).to include("Token can't be blank")
      end
      it '郵便番号は半角のハイフンを含んだ正しい形式でないと保存できない' do
        @item_buy_buyer.post_code = '1234567'
        @item_buy_buyer.valid?
        expect(@item_buy_buyer.errors.full_messages).to include("Post code is invalid")
      end
      it '電話番号は10桁以上11桁以内の半角数値でないと保存できない' do
        @item_buy_buyer.phone_number = '０００００００００'
        @item_buy_buyer.valid?
        expect(@item_buy_buyer.errors.full_messages).to include("Phone number is invalid")
      end
      it 'ユーザー情報がないと購入できない' do
        @item_buy_buyer.user_id = nil
        @item_buy_buyer.valid?
        expect(@item_buy_buyer.errors.full_messages).to include("User can't be blank")
      end
      it '商品情報がないと購入できない' do
        @item_buy_buyer.item_id = nil
        @item_buy_buyer.valid?
        expect(@item_buy_buyer.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end