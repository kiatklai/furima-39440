class Item < ApplicationRecord
  with_options numericality: { other_than: 1, message: "を入力してください" } do
    validates :category_id
    validates :item_condition_id
    validates :delivery_fee_id
    validates :delivery_day_id
    validates :area_id
  end

  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "は範囲内を入力してください"}
  validates :price, numericality: { only_integer: true, message: "半角を入力してください" }

  validates :image, :name, :description, presence: true

  belongs_to :user
  has_one_attached :image
  has_one :buyer
  has_many :comments

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :item_condition
  belongs_to :delivery_fee
  belongs_to :delivery_day
  belongs_to :area
end
