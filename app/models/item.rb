class Item < ApplicationRecord

  with_options presence: true do
    validates :image
    validates :name
    validates :description
    validates :category_id
    validates :status_id
    validates :shipping_charge_id
    validates :shipped_area_id
    validates :day_to_shipped_id
    validates :price
  end

  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :shipping_charge
  belongs_to :shipped_area
  belongs_to :day_to_shipped

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :status_id
    validates :shipping_charge_id
    validates :shipped_area_id
    validates :day_to_shipped_id
  end

  validates_inclusion_of :price, in: 300..9999999
  validates :price, numericality: { with: /\A[0-9]+\z/}

end
