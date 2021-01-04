class UserOrder
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :city, :address, :phone_number, :purchese, :building, :token

  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/ }  #郵便番号（「-」を含む且つ7桁）
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :city
    validates :address
    validates :phone_number, format: { with: /\A\d{11}\z/ }  #携帯番号(ハイフンなし11桁)
    validates :user_id
    validates :item_id
    validates :token
  end


  def save
    # 購入情報
    purchese = Purchese.create(user_id: user_id, item_id: item_id)  # 購入に必要な情報を、キーとして作成する
    # 配送先情報
    Delivery.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, address: address, building: building, phone_number: phone_number, purchese_id: purchese.id)  # purchese_id: には、上の購入情報で生成した purchese から .id で値を引っ張ってきている
  end

end