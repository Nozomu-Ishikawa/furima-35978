class OrderAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :shipped_area_id, :municipality, :address, :builing_name, :phone_number, :order, :token

  with_options presence: true do
    validates :token
    validates :user_id
    validates :item_id
    validates :shipped_area_id
    validates :address
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :municipality
    validates :phone_number, numericality: { only_integer: true }
  end
 
  with_options numericality: { other_than: 1 } do
    validates :shipped_area_id
  end

  def save
    # 寄付情報を保存し、変数donationに代入する
    order = Order.create(user_id: user_id, item_id: item_id)
    # 住所を保存する
    # donation_idには、変数donationのidと指定する
    Address.create(postal_code: postal_code, shipped_area_id: shipped_area_id, municipality: municipality, address: address, builing_name: builing_name,  phone_number: phone_number, order_id: order.id)
  end
end