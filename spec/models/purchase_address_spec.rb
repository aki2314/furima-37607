require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @purchase_address = FactoryBot.build(:purchase_address, user_id: user.id, item_id: item.id)
  end
  describe '購入機能' do
    context '購入できない場合' do
      it '郵便番号が必須であること' do
        @purchase_address.post_number = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Post number can't be blank",
                                                                  'Post number is invalid. Include hyphen(-)')
      end
      it '郵便番号は、「3桁ハイフン4桁」の半角文字列のみ保存可能なこと' do
        @purchase_address.post_number = 3_333_333
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Post number is invalid. Include hyphen(-)')
      end
      it '都道府県が必須であること' do
        @purchase_address.shipmentsource_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Shipmentsource can't be blank")
      end
      it '市区町村が必須であること' do
        @purchase_address.si = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Si can't be blank")
      end
      it '番地が必須であること' do
        @purchase_address.banti = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Banti can't be blank")
      end
      it '電話番号が必須であること' do
        @purchase_address.phone = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone can't be blank")
      end
      it '電話番号は、9桁以下では保存できないこと' do
        @purchase_address.phone = '000222111'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Phone is invalid')
      end
      it '電話番号は、12桁以上では保存できないこと' do
        @purchase_address.phone = '000222111333'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Phone is invalid')
      end
      it '電話番号に半角数字以外が含まれている場合は購入できない' do
        @purchase_address.phone = '0002221113a'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Phone is invalid')
      end
      it 'tokenが空では登録できないこと' do
        @purchase_address.token = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
  context '出品できる場合' do
    it '建物名は任意であること。' do
      @purchase_address.building = ''
      expect(@purchase_address).to be_valid
    end
    it '入力内容埋まれば保存ができること' do
      expect(@purchase_address).to be_valid
    end
  end
end
