class Product < ApplicationRecord
    has_many :users, through: :carts
    has_many :carts
end
