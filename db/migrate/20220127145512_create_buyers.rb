class CreateBuyers < ActiveRecord::Migration[6.0]
  def change
    create_table :buyers do |t|
      t.string     :post_code,    nill: false
      t.integer    :area_id,      nill: false
      t.string     :city,         nill: false
      t.string     :address,      nill: false
      t.string     :building_name
      t.string     :phone_number, nill: false
      t.references :item_buy,     nill: false, foreign_key: true
      
      t.timestamps
    end
  end
end
