class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  validates :name,              presence: true
  validates :detail,            presence: true
  validates :category_id,       presence: true
  validates :status_id,         presence: true
  validates :shipmentsource_id, presence: true 
  validates :price,             presence: true, format: { with: /\A[0-9]+\z/ }, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  validates :derivalyprice_id,  presence: true
  validates :derivalyday_id,    presence: true
  validates :user,              presence: true

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :shipmentsource
  belongs_to :derivalyprice
  belongs_to :derivalyday

  validates :title, :text, presence: true
  validates :genre_id, numericality: { other_than: 1 , message: "can't be blank"}
end
