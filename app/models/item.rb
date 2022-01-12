class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category, :status, :charge, :area, :delivery_day
  has_one_attached :image
  
  validates :name, :description, :price, presence: true
  validates :category_id, :status_id, :change_id, :area_id, :delivery_day_id, numericality: { other_than: 1, message: "can't be blank"} 

  end
