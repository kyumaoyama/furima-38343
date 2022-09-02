class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  #テーブルのアソシエーション
  belongs_to :user
   #アクティブハッシュのアソシエーション
  belongs_to :shipping_day
  belongs_to :category
  belongs_to :prefecture
  belongs_to :situation
  belongs_to :shipping_charge
  
  has_one_attached :image
  
  with_options presence: true do
    validates :user_id
    validates :image
    validates :name
    validates :explanation
    validates :category_id
    validates :situation_id
    validates :shipping_charge_id
    validates :prefecture_id
    validates :shipping_day_id
    
  end

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :situation_id
    validates :shipping_charge_id
    validates :prefecture_id
    validates :shipping_day_id
    
  end
end
