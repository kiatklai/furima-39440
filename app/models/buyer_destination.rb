class BuyerDestination
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :area_id, :city, :address, :building_name, :phone_number, :token

  with_options presence: true do
    # buyerモデルのバリデーション
    validates :user_id
    validates :item_id
    # destinationモデルのバリデーション
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :area_id, numericality: { other_than: 0, message: "can't be blank" }
    validates :city
    validates :address
    validates :phone_number, format: { with: /\A[0-9]{11}\z/, message: 'is invalid' }
    # トークンのバリデーション
    validates :token
  end

  def save
    buyer = Buyer.create(user_id: user_id, item_id: item_id)
    # ストロングパラメーターでデータが運ばれ、それらが保存のタイミングで「buyer_id」が生成され、保存される。
    Destination.create(buyer_id: buyer.id, post_code: post_code, area_id: area_id, city: city, address: address, building_name: building_name, phone_number: phone_number)
  end
end