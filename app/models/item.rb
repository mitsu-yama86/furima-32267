class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :state
  belongs_to :burden
  belongs_to :prefecture
  belongs_to :day

  belongs_to :user
  has_one :purchase

  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :product_name, length: { maximum: 40 }
    validates :text, length: { maximum: 1000}
    with_options numericality: { other_than: 1 } do  #カテゴリーの選択が、「id: 1」の「name: --」のままでは保存できないという記述
      validates :category_id
      validates :state_id
      validates :burden_id
      validates :prefecture_id
      validates :day_id
    end
    validates :price, format: { with: /\A[0-9]+\z/ }, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
    validates :user
  end
end
