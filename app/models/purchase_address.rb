class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :post_number, :shipmentsource_id, :si, :banti, :building, :phone, :user_id, :item_id

  validates :post_number, presence: true, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  validates :shipmentsource_id, numericality: {other_than: 1, message: "can't be blank"}
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

