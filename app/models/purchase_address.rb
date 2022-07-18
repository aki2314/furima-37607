class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :purchase_id, :post_number, :shipmentsource_id, :si, :banti, :building, :phone, :user_id, :item_id

  validates :purchase_id, presence: true
  validates :post_number, presence: true, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  validates :shipmentsource, numericality: {other_than: 0, message: "can't be blank"}
  validates :si, presence: true
  validates :banti, presence: true
  validates :phone, presence: true, format: { with: /\A(0{1}\d{9,10})\z/ }
  validates :user_id, presence: true
  validates :item_id, presence: true

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Address.create(purchase_id: purchase.id, post_number: post_number, shipmentsource: shipmentsource, si: si, banti: banti, building: building, phone: phone)
  end
end
