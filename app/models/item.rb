class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_one :purchase

  validates :name,              presence: true
  validates :detail,            presence: true
  validates :category_id,       presence: true
  validates :status_id,         presence: true
  validates :shipmentsource_id, presence: true
  validates :price,             presence: true,
                                numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  validates :derivalyprice_id,  presence: true
  validates :derivalyday_id,    presence: true
  validates :image,             presence: true

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :shipmentsource
  belongs_to :derivalyprice
  belongs_to :derivalyday

  validates :category_id, numericality: { other_than: 1 }
  validates :status_id, numericality: { other_than: 1 }
  validates :shipmentsource_id, numericality: { other_than: 1 }
  validates :derivalyprice_id, numericality: { other_than: 1 }
  validates :derivalyday_id, numericality: { other_than: 1 }
end
