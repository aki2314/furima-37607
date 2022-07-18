require 'rails_helper'

RSpec.describe Purchase, type: :model do
  before do
    @purchase = FactoryBot.build(:purchase)
  end
  describe '購入機能' do
    context '購入できない場合' do
    it '配送先の住所情報も購入の都度入力させること。'do
    @purchase_address.si = ''
    @purchase_address.valid?
    expect(@purchase_address.errors.full_messages).to include("Si can't be blank")
  end
    it '郵便番号が必須であること'do
    @purchase_address.post_number = ''
    @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Post_number can't be blank")
  end
    it '郵便番号は、「3桁ハイフン4桁」の半角文字列のみ保存可能なこと。'do
    @purchase_address.post_number = 3333333
    @purchase_address.valid?
    binding.pry
  end
    it '都道府県が必須であること。'do
    @purchase_address.shipmentsource = nil
    @purchase_address.valid?
    expect(@purchase_address.errors.full_messages).to include("Shipmentsource can't be blank")
  end
    it '市区町村が必須であること。'do
    @purchase_address.si = ""
    @purchase_address.valid?
    expect(@purchase_address.errors.full_messages).to include("Si can't be blank")
  end
    it '番地が必須であること。'do
    @purchase_address.banti = ""
    @purchase_address.valid?
    expect(@purchase_address.errors.full_messages).to include("Banti can't be blank")
  end
    it '電話番号が必須であること'do
    @purchase_address.phone = ''
    @purchase_address.valid?
    expect(@purchase_address.errors.full_messages).to include("Si can't be blank")
  end
    it '電話番号は、10桁以上11桁以内の半角数値のみ保存可能なこと。'do
    @purchase_addresse.phone = "000222111"
    @purchase_address.valid?
    expect(@purchase_address.errors.full_messages).to include("Phone is invalid")
    end
  end
    context '出品できる場合' do
    it '建物名は任意であること。'do
    @purchase_address.building = ""
    expect(@purchase_address).to be_valid
    end
  end
end
