class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :charge
  belongs_to :area
  belongs_to :delivery_day
  belongs_to :user
  has_one_attached :image
  has_one    :item_buy

  validates :image, :name, :description, :price, presence: true
  validates :category_id, :status_id, :charge_id, :area_id, :delivery_day_id, numericality: { other_than: 1, message: "can't be blank"} 
  
  validates :price, inclusion: { in: 300..9_999_999 }, format: { with: /\A[0-9]+\z/ }
  end
