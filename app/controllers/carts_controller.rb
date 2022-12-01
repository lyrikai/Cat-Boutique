class CartsController < ApplicationController

    def index
        @cartlist = Cart.where(user: current_user)  
        
        
    end

    def destroy
        puts "-" * 60
        @gosid = Cart.find(params[:id])
        @gosid.destroy
        redirect_to carts_path
    end

    def show
        @gosid = Cart.find(params[:id])
    end

    def new

    end

    def edit

    end

    def update

    end
 
    def create
 
    end

end
