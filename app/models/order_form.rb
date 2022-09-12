class OrderForm
  include ActiveModel::Model
  attr_accessor :postcode, :prefecture_id, :city, :phone_number, :building, :address, :user_id,:item_id,:token
  with_options presence: true do
  #oerderモデルのバリデーション
    validates :user_id
    validates :item_id
  #ship_addresモデルのバリデーション
    validates :postcode, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }
    validates :city
    validates :address
    validates :phone_number, format: { with: /\A\d{10}\z/, message: 'is invalid' }

    validates :token
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    ShipAddresses.create(order_id: order.id,postcode: postcode,prefecture_id: prefecture_id,city: city,building: building,phone_number: phone_number,address: address)
  end
end