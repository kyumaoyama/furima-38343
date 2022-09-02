class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  #テーブルのアソシエーション
  belongs_to :user
   #アクティブハッシュのアソシエーション
  belongs_to :shipping_date
  belongs_to :category
  belongs_to :prefecture
  belongs_to :item_status
  belongs_to :shipping_cost
  
  with_options presence: true do
    validates :user_id
    validates :image
    validates :name
    validates :explanation
    validates :category_id
    validates :item_status_id
    validates :shipping_cost_id
    validates :prefecture_id
    validates :shipping_date_id
    
  end

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :situation_id
    validates :shipping_charge_id
    validates :prefecture_id
    validates :shipping_day_id
    
  end
end
