class ProductsController < ApplicationController

    def show
        @prod = Product.find(params[:id])
    end 

    def create
        puts "-" * 60
        test = Product.find(params[:id])
        puts test.inspect
        puts "-" * 60
        @new = Cart.new(user: current_user, product: test)
        puts "-" * 60
        puts @new.inspect
        puts "-" * 60

        if @new.save 
            redirect_to root_path
        else  
           
        end

    end
end
