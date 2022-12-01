class Product < ApplicationRecord
    has_many :users, through: :carts
    has_many :carts
    has_one_attached :image
    has_many :admins
end
