class ItemBuyBuyer
  include ActiveModel::Model
  attr_accessor :post_code, :area_id, :city, :address, :building_name, :phone_number, :user_id, :item_id, :item_buy_id, :token

  with_options presence: true do
  validates :item_id
  validates :user_id
  validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/ }
  validates :area_id, numericality: { other_than: 1, message: "can't be blank"} 
  validates :city
  validates :address
  validates :phone_number, format: { with: /\A\d{10,11}\z/}
  validates :token, presence: true
  end

  def save
    item_buy = ItemBuy.create(user_id: user_id, item_id: item_id)
    Buyer.create(post_code: post_code, area_id: area_id, city: city, address: address, building_name: building_name, phone_number: phone_number, item_buy_id: item_buy.id)
  end
end