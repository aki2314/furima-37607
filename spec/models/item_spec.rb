require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  describe '商品出品機能' do
    context '出品できない場合' do
      it '商品画像を1枚つけることが必須' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名が必須' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it '商品の説明が必須' do
        @item.detail = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Detail can't be blank")
      end
      it 'カテゴリーの情報が必須' do
        @item.category = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it '商品の状態の情報が必須' do
        @item.status = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank")
      end
      it '配送料の負担の情報が必須' do
        @item.derivalyprice = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Derivalyprice can't be blank")
      end
      it '発送元の地域の情報が必須' do
        @item.shipmentsource = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipmentsource can't be blank")
      end
      it '発送までの日数の情報が必須' do
        @item.derivalyday = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Derivalyday can't be blank")
      end
      it '価格の情報が必須' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it '価格は、¥300より下の時、保存不可' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
      end
      it '価格は、¥9999999より上の時、保存不可' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
      end
      it '価格は半角数値のみ保存可能' do
        @item.price = '１111'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
      it 'カテゴリで『---』が選択されている時保存出来ない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Category must be other than 1')
      end
      it '状態で『---』が選択されている時保存出来ない' do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Status must be other than 1')
      end
      it '発送元の地域で『---』が選択されている時保存出来ない' do
        @item.shipmentsource_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipmentsource must be other than 1')
      end
      it '発送料金で『---』が選択されている時保存出来ない' do
        @item.derivalyprice_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Derivalyprice must be other than 1')
      end
      it '発送日数で『---』が選択されている時保存出来ない' do
        @item.derivalyday_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Derivalyday must be other than 1')
      end
      it 'userが紐付いていなければ出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
    context '出品できる場合' do
      it '出品データを保存できる' do
        expect(@item).to be_valid
      end
    end
  end
end
