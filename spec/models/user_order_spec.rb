require 'rails_helper'

RSpec.describe UserOrder, type: :model do
  before do
    @user_order = FactoryBot.build(:user_order)
  end

  describe '商品購入' do
    context '商品購入がうまくいく時' do
      it "全ての情報が正しく記入できていれば、商品を購入できる" do
        expect(@user_order).to be_valid
      end

      it "建物名が空でも、購入ができる" do
        @user_order.building = ""
        expect(@user_order).to be_valid
      end
    end

    context '商品購入がうまくいかない時' do
      it "postal_codeが空だと購入ができない" do
        @user_order.postal_code = ""
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Postal code can't be blank")
      end

      it "postal_codeが半角英字だと購入できない" do
        @user_order.postal_code = "aaaaaa"
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Postal code is invalid")
      end

      it "postal_codeが全角かなだと購入できない" do
        @user_order.postal_code = "ああああああ"
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Postal code is invalid")
      end

      it "postal_codeが全角カナだと購入できない" do
        @user_order.postal_code = "アアアアアア"
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Postal code is invalid")
      end
      
      it "postal_codeが全角漢字だと購入できない" do
        @user_order.postal_code = "嗚呼嗚呼嗚呼"
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Postal code is invalid")
      end
      
      it "postal_codeがハイフンが無いと購入できない" do
        @user_order.postal_code = "1111111"
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Postal code is invalid")
      end
      
      it "prefecture_idが1だと購入できない" do
        @user_order.prefecture_id = 1
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Prefecture must be other than 1")
      end

      it "cityが空だと購入できない" do
        @user_order.city = ""
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("City can't be blank")
      end

      it "addressが空だと購入できない" do
        @user_order.address = ""
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Address can't be blank")
      end

      it "phone_numberが空だと購入できない" do
        @user_order.phone_number = ""
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Phone number can't be blank")
      end

      it "phone_numberが半角英字だと購入できない" do
        @user_order.phone_number = "aaaaaaaaaaa"
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Phone number is invalid")
      end

      it "phone_numberが全角かなだと購入できない" do
        @user_order.phone_number = "あああああああああああ"
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Phone number is invalid")
      end

      it "phone_numberが全角カナだと購入できない" do
        @user_order.phone_number = "アアアアアアアアアアア"
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Phone number is invalid")
      end

      it "phone_numberが全角漢字だと購入できない" do
        @user_order.phone_number = "嗚呼嗚呼嗚呼嗚呼嗚呼鳴"
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Phone number is invalid")
      end

      it "tokenが空だと購入できない" do
        @user_order.token = ""
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Token can't be blank")
      end

      it "user_idが空だと購入できない" do
        @user_order.user_id = ""
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("User can't be blank")
      end

      it "item_idが空だと購入できない" do
        @user_order.item_id = ""
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
