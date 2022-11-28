class ProductsController < ApplicationController

    def show
        @prod = Product.find(params[:id])
    end 
end
