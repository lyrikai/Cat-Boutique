class BuysController < ApplicationController

    def index
        @orderlist = Order.where(user: current_user)  
    end
end
